class User < ApplicationRecord
  has_many :transactions
  has_many :comments
  belongs_to :organization, optional: true
  accepts_nested_attributes_for :organization
  validates_presence_of :organization
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
