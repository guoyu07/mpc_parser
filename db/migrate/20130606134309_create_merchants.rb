class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :mid
      t.string :brand
      t.string :branch
      t.string :address
      t.string :tag
      t.string :road_name
      t.string :area_name
      t.string :latitude
      t.string :longitude

      t.timestamps
    end

    add_index :merchants, :brand
    add_index :merchants, :branch
    add_index :merchants, :road_name
    add_index :merchants, :area_name
  end
end
