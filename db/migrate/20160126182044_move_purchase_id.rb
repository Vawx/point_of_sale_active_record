class MovePurchaseId < ActiveRecord::Migration
  def change
    remove_column :purchases, :purchase_id, :integer
    add_column :products, :purchase_id, :integer
  end
end
