defmodule ReaderEx.EntryTest do
  use ReaderEx.ModelCase

  alias ReaderEx.Entry

  @valid_attrs %{author: "some content", duration: "some content", enclosure: "some content", image: "some content", link: "some content", subtitle: "some content", summary: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Entry.changeset(%Entry{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Entry.changeset(%Entry{}, @invalid_attrs)
    refute changeset.valid?
  end
end
