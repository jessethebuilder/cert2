class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.float :credits, :default => 0
      t.float :debits, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
