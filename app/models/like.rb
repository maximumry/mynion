class Like < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates :user, presence: {message: "can't be blank"}
  validates :opinion, presence: {message: "can't be blank"}
end
