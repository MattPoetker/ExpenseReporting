class Transaction < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :currency, presence: true
  validates :amount, presence: true, numericality: true
  validates :description, presence: true
  validate :is_valid_date

  private

  def is_valid_date
    if date == nil
      self.errors[:base] << "Date format is invalid"
    end
  end
end
