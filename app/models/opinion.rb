class Opinion < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true

  def self.search(search)
    if search != ""
      Opinion.where('text LIKE(?)', "%#{search}%")
    else
      Opinion.includes(:user)
    end
  end
end
