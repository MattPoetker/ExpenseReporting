json.extract! transaction, :id, :date, :departement, :amount, :currency, :covered, :description, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
