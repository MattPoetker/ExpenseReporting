json.extract! transaction, :id, :date, :department, :amount, :currency, :covered, :description, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
