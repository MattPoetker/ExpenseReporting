class AddUserRefToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :user, foreign_key: true, default: 1, null: false
  end
end
