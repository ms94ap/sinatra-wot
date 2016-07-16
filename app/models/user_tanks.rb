class UserTank < ActiveRecord::Base
  belongs_to :user
  belongs_to :tank

end
