defmodule ReaderEx.FeedControllerTest do
  use ReaderEx.ConnCase

  alias ReaderEx.Feed
  @valid_attrs %{name: "some content", url: "some content", user_id: 42}
  @invalid_attrs %{}
end
