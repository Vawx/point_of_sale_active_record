require 'spec_helper'
require 'product'
require 'purchase'
require 'pry'


describe Product do
  describe "#new" do
    it 'will create a new product' do
      product = Product.create( {name: "Food", cost: 12.43} )
      expect(product.name).to(eq("Food"))
      expect(product.cost).to(eq(12.43))
    end
  end
end


describe Purchase do
  describe "#new" do
    it 'will create a new purchase' do
      purchase = Purchase.create( {name: "purchase"} )
      expect(purchase.name).to(eq("purchase"))
    end
  end
  describe "#purchase" do
    it 'will add products to purchase' do
      purchase_one = Purchase.create( {name: "purchase"} )
      product_one = Product.create( { name: "Food", cost: 1.99, purchase_id: purchase_one.id })
      product_two = Product.create( { name: "Drink", cost: 3.99, purchase_id: purchase_one.id })
      binding.pry
      expect(purchase_one.products).to(eq([product_one, product_two]))
    end
  end
end
