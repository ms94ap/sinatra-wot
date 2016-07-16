class TankType < ActiveRecord::Base
  belongs_to :tank
  belongs_to :genre

end
