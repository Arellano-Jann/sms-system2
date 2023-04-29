defmodule Sms.Business.Store do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sms.Business.Product

  schema "stores" do
    field :identifier, :integer
    field :location, :string
    has_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:location, :identifier])
    |> validate_required([:location, :identifier])
  end
end
