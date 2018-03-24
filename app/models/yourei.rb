class Yourei < ApplicationRecord
  belongs_to :word
  belongs_to :user

  validates :word_id, presence: true
  validates :content, presence: true, length: { maximum: 511 }
#  validates :user_id, presence: true
end
