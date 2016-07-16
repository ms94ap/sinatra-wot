class CreateTankTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :tank_types do |t|
      t.string :name #medium, light, tds, hv, spg
    end
  end
end
