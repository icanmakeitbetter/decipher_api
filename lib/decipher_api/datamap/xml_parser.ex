defmodule DecipherAPI.Datamap.XMLParser do
  import SweetXml

  def parse(xml) do
    ordering =
      xml
      |> xpath(~x"/survey/*"el)
      |> parse_questions_and_breaks
      |> Enum.chunk_by(fn question_or_break ->
        question_or_break == :page_break
      end)
      |> Enum.reject(fn
        [:page_break | _rest] ->
          true
        _page ->
          false
      end)

    {comments, questions} =
      ordering
      |> List.flatten
      |> Enum.into(Map.new, fn metadata ->
        {Map.fetch!(metadata, :label), metadata}
      end)
      |> Enum.split_with(fn {_k, v} ->
        v.tag_name == :html
      end)

    %{
      comments: Map.new(comments),
      name: xpath(xml, ~x"@alt") |> to_string,
      ordering: Enum.map(ordering, fn page ->
        Enum.map(page, fn question -> question.label end)
      end),
      questions: Map.new(questions)
    }
  end

  defp parse_questions_and_breaks(nodes) do
    nodes
    |> filter_tags
    |> parse_tags
  end

  defp filter_tags(tags) do
    Enum.filter(tags, fn
      xmlElement(name: :suspend) ->
        true
      xmlElement(name: :loop) ->
        true
      xmlElement(attributes: attrs) ->
        Enum.any?(attrs, fn
          xmlAttribute(name: :label) ->
            true
          _attr ->
            false
        end) # and not Enum.any?(attrs, fn
        #   xmlAttribute(name: :where, value: value) ->
        #     value |> to_string |> String.contains?("execute")
        #   _attr ->
        #     false
        # end)
      _node ->
        false
    end)
  end

  defp parse_tags(tags) do
    Enum.flat_map(tags, fn
      xmlElement(name: :suspend) ->
        [:page_break]
      xmlElement(name: :loop) = loop ->
        parse_loop(loop)
      xmlElement(name: tag_name, attributes: attrs) = node ->
        attrs
        |> Enum.into(Map.new, fn xmlAttribute(name: name, value: value) ->
          {name, to_string(value)}
        end)
        |> Map.put(:comment, xpath(node, ~x"comment/text()"s))
        |> Map.put(:element_text, xpath(node, ~x"text()"s))
        |> Map.put(:tag_name, tag_name)
        |> List.wrap
    end)
  end

  defp parse_loop(loop) do
    parsed =
      loop
      |> xpath(~x"./block/*"el)
      |> parse_questions_and_breaks

    vars =
      parsed
      |> Enum.reject(fn question_or_break ->
        question_or_break == :page_break
      end)
      |> Enum.map(fn question ->
        String.replace(
          question.label,
          ~r{\A[^\[]*?\[loopvar:\s*([^\]]+)\]},
          "\\1"
        )
      end)
      |> Enum.uniq

    loop
    |> find_rows(vars)
    |> duplicate_questions_for_rows(parsed)
  end

  defp find_rows(loop, vars) do
    loop
    |> xpath(~x"./looprow"el)
    |> Enum.map(fn row ->
      Enum.into(vars, Map.new, fn var ->
        {
          var,
          row
          |> xmlElement(:attributes)
          |> Enum.find(fn xmlAttribute(name: name) ->
            to_string(name) == var
          end)
          |> xmlAttribute(:value)
          |> to_string
        }
      end)
    end)
  end

  defp duplicate_questions_for_rows(rows, questions) do
    Enum.flat_map(rows, fn row ->
      questions
      |> Enum.map(fn
        :page_break ->
          :page_break
        question ->
          new_label =
            Regex.scan(~r{\[loopvar:\s*([^\]]+)\]}, question.label)
            |> Enum.reduce(question.label, fn [replacement, var], label ->
              String.replace(label, replacement, Map.fetch!(row, var))
            end)
          Map.put(question, :label, new_label)
      end)
    end)
  end
end
