class Organization < ApplicationRecord
  has_many :users
  has_many :transactions, through: :users
end
