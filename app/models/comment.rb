class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates :text, presence: {message: "can't be blank"}
  validates :user, presence: {message: "can't be blank"}
  validates :opinion, presence: {message: "can't be blank"}
end
