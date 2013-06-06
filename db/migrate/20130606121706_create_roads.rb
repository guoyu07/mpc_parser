class CreateRoads < ActiveRecord::Migration
  def change
    create_table :roads do |t|
      t.string :name

      t.timestamps
    end
  end
end
