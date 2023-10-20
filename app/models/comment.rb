class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates :text, presence: true
end
