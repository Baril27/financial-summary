class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.monetize :balance
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
