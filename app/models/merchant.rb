class Merchant < ActiveRecord::Base
  attr_accessible :address, :area_name, :brand, :branch, :latitude, :longitude, :mid, :road_name, :tag
end
