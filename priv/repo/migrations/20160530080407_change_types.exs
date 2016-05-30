defmodule ReaderEx.Repo.Migrations.ChangeTypes do
  use Ecto.Migration

  def change do
    alter table(:feeds) do
      modify :name, :text
      modify :url, :text
      modify :user_id, :integer
    end

    alter table(:entries) do
      modify :author, :text
      modify :image, :text
      modify :link, :text
      modify :subtitle, :text
      modify :summary, :text
      modify :title, :text
      modify :duration, :text
      modify :enclosure, :text
    end

  end
end
