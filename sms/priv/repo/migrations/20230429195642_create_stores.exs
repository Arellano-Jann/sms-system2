defmodule Sms.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :location, :string
      add :identifier, :integer

      timestamps()
    end
  end
end
