defmodule ReaderEx.EntryControllerTest do
  use ReaderEx.ConnCase

  alias ReaderEx.Entry
  @valid_attrs %{author: "some content", duration: "some content", enclosure: "some content", image: "some content", link: "some content", subtitle: "some content", summary: "some content", title: "some content"}
  @invalid_attrs %{}
end
