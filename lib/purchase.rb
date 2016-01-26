require 'sinatra/activerecord'

class Purchase < ActiveRecord::Base
  has_many(:products)
end
