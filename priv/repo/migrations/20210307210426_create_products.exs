defmodule ExCosmic.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :uuid, :uuid
      add :sku, :string
      add :name, :string
      add :description, :string
      add :regular_price, :float
      add :discounted_price, :float
      add :stock_quantity, :integer
      add :lead_time, :integer

      timestamps()
    end

  end
end
