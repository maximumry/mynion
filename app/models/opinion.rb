class Opinion < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true

  def self.search(search)
    if search != ""
      Opinion.where('text LIKE(?)', "%#{search}%").order("created_at DESC")
    else
      Opinion.includes(:user).order("created_at DESC")
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
