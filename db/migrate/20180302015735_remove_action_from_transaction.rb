class RemoveActionFromTransaction < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :action
  end
end
