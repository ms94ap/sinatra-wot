class CreateTanks < ActiveRecord::Migration[4.2]
  def change
    create_table :tanks do |t|
      t.integer :user_id
      t.string :name
      t.string :nation
      t.integer :tank_type_id
    end
  end
end
