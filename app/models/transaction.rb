class Transaction < ApplicationRecord
  validates :date, presence: true
  validate :is_valid_date

  private

  def is_valid_date
    if date == nil
      self.errors[:base] << "Date format is invalid"
    end
  end
end
