defmodule Sms.Business.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :identifier, :integer
    field :location, :string

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:location, :identifier])
    |> validate_required([:location, :identifier])
  end
end
