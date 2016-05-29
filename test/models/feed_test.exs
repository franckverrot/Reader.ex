defmodule ReaderEx.FeedTest do
  use ReaderEx.ModelCase

  alias ReaderEx.Feed

  @valid_attrs %{name: "some content", url: "some content", user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Feed.changeset(%Feed{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Feed.changeset(%Feed{}, @invalid_attrs)
    refute changeset.valid?
  end
end
