class GiveProductsInventoryCount < ActiveRecord::Migration
  def change
    add_column(:products, :inventory_count, :int)
  end
end
