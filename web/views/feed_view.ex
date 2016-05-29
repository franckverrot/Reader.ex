defmodule ReaderEx.FeedView do
  use ReaderEx.Web, :view

  def render("index.json", %{feeds: feeds}) do
    %{
      feeds: Enum.map(feeds, fn(feed) ->
        %{
          name: feed.name,
          url: feed.url,
          entries: Enum.map(feed.entries,
            fn(entry) ->
              %{
                title: entry.title,
                link: entry.link
              }
            end)
        }
      end)
    }
  end

  def render("create_success.json", %{feed: feed}) do
    %{
      feed: %{
        name: feed.name,
        url: feed.url,
        entries: Enum.map(feed.entries,
          fn(entry) ->
            %{
              title: entry.title,
              link: entry.link
            }
          end)
        }
    }
  end

  # source: http://www.thisisnotajoke.com/blog/2015/09/serializing-ecto-changeset-errors-to-jsonapi-in-elixir.html
  def render("create_error.json", %{changeset: changeset}) do
    errors = Enum.map(changeset.errors, fn {field, detail} ->
      %{
        source: %{ pointer: "/data/attributes/#{field}" },
        title: "Invalid Attribute",
        detail: render_detail(detail)
      }
    end)

    %{errors: errors}
  end

  def render_detail({message, values}) do
    Enum.reduce values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end
  end

  def render_detail(message) do
    message
  end
end
