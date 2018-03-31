class Word < ApplicationRecord
  belongs_to :user
  has_many :youreis

  validates :user_id, presence: true
  validates :content, presence: true,
      format: { with: /\A[ぁ-ゞァ-ヾ]{1,128}\z/, on: :create },
      uniqueness: true
      #重複があったら、
      #登録・ログインしていなければ、登録・ログインするか、他の尻取りにするかを選択、
      #ログインしていれば、用例を書くか、他の尻取りにするかを選択
      #これはバリデートの対象ではなさそうだな
end
