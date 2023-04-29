defmodule Sms.Business.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sms.Business.Store

  schema "products" do
    field :count, :integer
    field :name, :string
    field :retail, :float
    field :wholesale, :float
    belongs_to :store, Store

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :wholesale, :retail, :count, :store_id])
    |> validate_required([:name, :wholesale, :retail, :count, :store_id])
  end
end
