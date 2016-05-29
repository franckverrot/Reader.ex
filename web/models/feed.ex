defmodule ReaderEx.Feed do
  use ReaderEx.Web, :model

  schema "feeds" do
    field :name, :string
    field :url, :string
    field :user_id, :integer
    has_many :entries, ReaderEx.Entry

    timestamps
  end

  @required_fields ~w(name url)
  @optional_fields ~w(user_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:entries)
  end
end
