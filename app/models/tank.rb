class Tank < ActiveRecord::Base
  belongs_to :tank_type
  belongs_to :user
end
