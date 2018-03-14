class Word < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true,
      format: { with: /[ぁ-ゞァ-ヾ]{1,128}/, on: :create }
end
