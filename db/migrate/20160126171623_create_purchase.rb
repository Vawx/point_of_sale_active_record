class CreatePurchase < ActiveRecord::Migration
  def change
    create_table(:purchases) do |purchase|
      purchase.column :name, :string
    end
  end
end
