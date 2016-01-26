require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require './lib/product'
require './lib/purchase'
also_reload( './lib/**/*.rb')

get '/' do
  Purchase.delete_all
  @products = Product.all
  @purchases = Purchase.all
  @user = "manager"
  erb :index
end

get '/switch_user' do
  @products = Product.all
  @purchases = Purchase.all
  @user = params.fetch("select_id")
  if @user == "manager"
    @products.each do |prod|
      @purchases.each do |purch|
        if prod.purchase_id == purch.id
          prod.update( {purchase_id: -1})
        end
      end
    end
  end
  Purchase.delete_all
  if @user == "customer"
    @purchase = Purchase.create( {name: "new purchase"} )
    @purchase.save
  else
    @purchase = NilClass
  end
  @cart = []
  erb :index
end

post '/add_product/:purchase_id/:id' do
  @purchase = Purchase.find(params[:purchase_id])
  product = Product.find(params[:id])
  product.update({purchase_id: @purchase.id})
  @purchases = Purchase.all
  @cart = []
  cost = 0
  @total_cost = "0.0"
  @products = Product.all
  @products.each do |prod|
    if prod.purchase_id == @purchase.id
      prod.update( {purchased: true})
      prod.update( {inventory_count: prod.inventory_count - 1 })
      @cart.push( prod )
      cost += prod.cost.to_f
    end
  end
  @total_cost = cost.to_s
  erb :index
end

post '/add_product_to_inventory' do
  product_name = params.fetch("product_name")
  product_cost = params.fetch("product_cost").to_i
  product_inv_amount = params.fetch("inventory_amount").to_i
  new_product = Product.create( {name: product_name, cost: product_cost, purchase_id: -1, inventory_count: product_inv_amount })
  new_product.save

  redirect '/'
end
