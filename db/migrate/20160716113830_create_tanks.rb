class CreateTanks < ActiveRecord::Migration[4.2]
  def change
    create_table :tank do |t|
      t.string :name
      t.string :nation
    end
  end
end
