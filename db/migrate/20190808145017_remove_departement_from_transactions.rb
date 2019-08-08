class RemoveDepartementFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :departement
    add_column :transactions, :department, :string, default: "Other", null: false
  end
end
