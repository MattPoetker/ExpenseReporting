class Organization < ApplicationRecord
  has_many :users
  has_many :transactions, through: :users
  validates_presence_of :subdomain
end
