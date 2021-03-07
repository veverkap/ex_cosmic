defmodule ExCosmic.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :description, :string
    field :discounted_price, :float
    field :lead_time, :integer
    field :name, :string
    field :regular_price, :float
    field :sku, :string
    field :stock_quantity, :integer
    field :uuid, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:uuid, :sku, :name, :description, :regular_price, :discounted_price, :stock_quantity, :lead_time])
    |> validate_required([:uuid, :sku, :name, :description, :regular_price, :discounted_price, :stock_quantity, :lead_time])
  end
end
