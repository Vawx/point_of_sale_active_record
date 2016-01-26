class CreateProduct < ActiveRecord::Migration
  def change
    create_table(:products) do |product|
      product.column :name, :string
      product.column :cost, :float
    end
  end
end
