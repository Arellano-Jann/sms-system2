defmodule Sms.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :wholesale, :float
      add :retail, :float
      add :count, :integer
      add :store_id, references(:stores, on_delete: :nothing)

      timestamps()
    end

    create index(:products, [:store_id])
  end
end
