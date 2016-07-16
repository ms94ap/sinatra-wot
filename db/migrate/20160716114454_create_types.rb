class CreateTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :type do |t|
      t.string :name #medium, light, tds, hv, spg
    end
  end
end
