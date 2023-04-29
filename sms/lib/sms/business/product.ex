defmodule Sms.Business.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :count, :integer
    field :name, :string
    field :retail, :float
    field :wholesale, :float
    field :store_id, :id

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :wholesale, :retail, :count])
    |> validate_required([:name, :wholesale, :retail, :count])
  end
end
