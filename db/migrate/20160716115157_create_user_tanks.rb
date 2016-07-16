class CreateUserTanks < ActiveRecord::Migration[4.2]
  def change
    create_table :user_tank do |t|
      t.integer :user_id
      t.integer :tank_id
    end
  end
end
