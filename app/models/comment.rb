class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :expense, foreign_key: "transaction_id", class_name: "Transaction"
end
