class FixJoin < ActiveRecord::Migration
  def change
    remove_column :products, :product_id, :integer
    add_column :purchases, :purchase_id, :integer
  end
end
