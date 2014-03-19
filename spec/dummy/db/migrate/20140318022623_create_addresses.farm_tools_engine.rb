# This migration comes from farm_tools_engine (originally 20140304023525)
class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :street2
      t.string :street3
      t.string :number
      t.string :care_of

      t.string :city
      t.string :state
      t.string :zip

      t.float :latitude
      t.float :longitude

      t.string :has_address_type
      t.integer :has_address_id

      t.timestamps
    end
  end
end
