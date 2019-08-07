require 'rails_helper'

RSpec.describe Transaction, type: :model do

  #
  describe "on saving" do
    it "should be valid with valid attributes" do
      transaction = Transaction.new(date: DateTime.now.to_date)
      expect(transaction).to be_valid
    end
    it "should be invalid without a transaction date" do
      transaction = Transaction.new
      expect(transaction).to_not be_valid
    end
  end
end
