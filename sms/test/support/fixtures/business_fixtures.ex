defmodule Sms.BusinessFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sms.Business` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        identifier: 42,
        location: "some location"
      })
      |> Sms.Business.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        count: 42,
        name: "some name",
        retail: 120.5,
        wholesale: 120.5
      })
      |> Sms.Business.create_product()

    product
  end
end
