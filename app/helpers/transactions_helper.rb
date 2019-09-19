module TransactionsHelper
  def transaction_status(transaction)
    if transaction.transaction_status == "Submitted" || transaction.transaction_status == "On Hold"
      "badge-warning"
    elsif transaction.transaction_status == "Verified"
      "badge-primary"
    elsif transaction.transaction_status == "Paid"
      "badge-success"
    end
  end
end
