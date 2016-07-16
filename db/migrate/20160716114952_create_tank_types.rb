class CreateTankTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :tank_type do |t|
      t.integer :tank_id
      t.integer :type_id
    end

  end
end
