class Transaction < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :currency, presence: true
  validates :amount, presence: true, numericality: true
  validates :description, presence: true
  validate :is_valid_date

  def covered? #### move into transaction helper module ####
    if self.covered
      return "Yes"
    else
      return "No"
    end
  end
  def editable
    if self.transaction_status == 'Verified' || self.transaction_status == 'Paid'
      return false
    else
      return true
    end
  end
  private

  def is_valid_date
    if date == nil
      self.errors[:base] << "Date format is invalid"
    end
  end
end
