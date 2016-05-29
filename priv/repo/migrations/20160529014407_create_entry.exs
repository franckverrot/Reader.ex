defmodule ReaderEx.Repo.Migrations.CreateEntry do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :author, :string
      add :image, :string
      add :link, :string
      add :subtitle, :string
      add :summary, :string
      add :title, :string
      add :duration, :string
      add :enclosure, :string
      add :feed_id, references(:feeds)

      timestamps
    end

  end
end
