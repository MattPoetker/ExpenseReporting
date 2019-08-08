class AddTransactionStatusToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :transaction_status, :string, default: "Submitted", null: false
  end
end
