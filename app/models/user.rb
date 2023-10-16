class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true, length: {maximum: 6}
  validates :first_name, presence: true, length: {maximum: 6}

  has_many :opinions
  has_many :comments
  has_many :likes
end
