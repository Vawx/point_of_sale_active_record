require 'rspec'
require 'product'

describe Product do
  describe "#new" do
    it 'will create a new product' do
      product = Product.create( {name: "Food", cost: 12.43} )
      expect(product.name).to(eq("Food"))
      expect(product.cost).to(eq(12.43))
    end
  end
end
