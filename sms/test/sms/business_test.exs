defmodule Sms.BusinessTest do
  use Sms.DataCase

  alias Sms.Business

  describe "stores" do
    alias Sms.Business.Store

    import Sms.BusinessFixtures

    @invalid_attrs %{identifier: nil, location: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Business.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Business.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{identifier: 42, location: "some location"}

      assert {:ok, %Store{} = store} = Business.create_store(valid_attrs)
      assert store.identifier == 42
      assert store.location == "some location"
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{identifier: 43, location: "some updated location"}

      assert {:ok, %Store{} = store} = Business.update_store(store, update_attrs)
      assert store.identifier == 43
      assert store.location == "some updated location"
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_store(store, @invalid_attrs)
      assert store == Business.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Business.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Business.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Business.change_store(store)
    end
  end

  describe "products" do
    alias Sms.Business.Product

    import Sms.BusinessFixtures

    @invalid_attrs %{count: nil, name: nil, retail: nil, wholesale: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Business.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Business.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{count: 42, name: "some name", retail: 120.5, wholesale: 120.5}

      assert {:ok, %Product{} = product} = Business.create_product(valid_attrs)
      assert product.count == 42
      assert product.name == "some name"
      assert product.retail == 120.5
      assert product.wholesale == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{count: 43, name: "some updated name", retail: 456.7, wholesale: 456.7}

      assert {:ok, %Product{} = product} = Business.update_product(product, update_attrs)
      assert product.count == 43
      assert product.name == "some updated name"
      assert product.retail == 456.7
      assert product.wholesale == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_product(product, @invalid_attrs)
      assert product == Business.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Business.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Business.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Business.change_product(product)
    end
  end
end
