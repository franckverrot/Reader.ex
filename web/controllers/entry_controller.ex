defmodule ReaderEx.EntryController do
  use ReaderEx.Web, :controller

  alias ReaderEx.Entry

  plug :scrub_params, "entry" when action in [:create, :update]

end
