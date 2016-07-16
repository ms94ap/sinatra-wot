class Type < ActiveRecord::Base
  has_many :tank_types
  has_many :tank, through: :tank_types
  has_many :user, through: :tank

end
