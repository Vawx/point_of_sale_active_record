class AllowPurchasing < ActiveRecord::Migration
  def change
    add_column(:products, :purchased, :bool)
  end
end
