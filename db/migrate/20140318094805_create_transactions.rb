class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.boolean :debited
      t.float :amount
      t.integer :account_id

      t.timestamps
    end
  end
end
