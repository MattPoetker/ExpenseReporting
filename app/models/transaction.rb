class Transaction < ApplicationRecord
  belongs_to :user
  validates :date, presence: true

  private

  def is_valid_date
    if date == nil
      self.errors[:base] << "Date format is invalid"
    end
  end
end
