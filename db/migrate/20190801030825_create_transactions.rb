class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :departement
      t.float :amount
      t.string :currency
      t.boolean :covered
      t.text :description

      t.timestamps
    end
  end
end
