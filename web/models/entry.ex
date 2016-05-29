defmodule ReaderEx.Entry do
  use ReaderEx.Web, :model

  schema "entries" do
    field :author, :string
    field :image, :string
    field :link, :string
    field :subtitle, :string
    field :summary, :string
    field :title, :string
    field :duration, :string
    field :enclosure, :string
    belongs_to :feed, ReaderEx.Feed

    timestamps
  end

  @required_fields ~w(title link)
  @optional_fields ~w(author image link subtitle summary duration enclosure)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
