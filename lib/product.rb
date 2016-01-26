require 'sinatra/activerecord'

class Product < ActiveRecord::Base
  belongs_to(:purchase)
end
