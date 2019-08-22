class User < ApplicationRecord
  belongs_to :organization
  has_many :transactions
  has_many :comments
  validates_presence_of :organization
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
