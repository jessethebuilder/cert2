class CreateCerts < ActiveRecord::Migration
  def change
    create_table :certs do |t|
      t.float :amount
      t.integer :account_id

      t.integer :receiver_id
      t.string :receiver_identifier
      t.string :receiver_source
      t.integer :giver_id
      t.string :giver_identifier
      t.string :giver_source
      t.text :note
      t.boolean :credited

      t.timestamps
    end
  end
end
