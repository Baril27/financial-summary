class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :user_id, null: false
      t.monetize :amount
      t.string :action, null: false
      t.string :category, null: false
      t.timestamps
    end
  end
end
