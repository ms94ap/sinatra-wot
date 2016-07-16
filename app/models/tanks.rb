class Tank < ActiveRecord::Base
  has_many :tank_types
  has_many :user
  has_many :nations
end
