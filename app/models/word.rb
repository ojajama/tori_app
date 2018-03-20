class Word < ApplicationRecord
  belongs_to :user
  has_many :youreis

  validates :user_id, presence: true
  validates :content, presence: true,
      format: { with: /\A[ぁ-ゞァ-ヾ]{1,128}\z/, on: :create }
end
