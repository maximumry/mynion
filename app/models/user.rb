class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :last_name, presence: { message: "can't be blank"}, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
  validates :first_name, presence: { message: "can't be blank"}, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
  validates :email, presence: { message: "can't be blank" },
                    uniqueness: { message: "has already been taken" },
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "is invalid" }
  validates :password, presence: { message: "can't be blank" },
                        length: { minimum: 6, message: "is too short (minimum is 6 characters)" }
  validate :password_match

  private

  def password_match
    if password != password_confirmation
      errors.add(:password_confirmation, "Password confirmation doesn't match Password")
    end
  end
                        

  


  has_many :opinions
  has_many :comments
  has_many :likes
end
