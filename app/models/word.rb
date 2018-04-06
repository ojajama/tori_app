class Word < ApplicationRecord
  belongs_to :user
  has_many :youreis

  validates :user_id, presence: true
  validates :content, presence: true,
      format: { with: /\A[ぁ-ゞァ-ヾ]{1,128}\z/, on: :create },
      uniqueness: true, if: :nanashi?
      def nanashi?
        if user.username == "名無しの権兵衛"
          errors.add(:word, "もうあります。他のことばにするか、登録またはログインして！")
          #いったんここにはまると、ずっと。どうやって抜けるのか。
        #else
        #  errors.add(:word, "もうあります。他のことばにするか、用例を書いて！")
          #当該用例集にリンク
          #前提として、同語の用例は同じページにまとめたい
        end
      end

    #重複があったら、
      #登録・ログインしていなければ、登録・ログインするか、他の尻取りにするかを選択、
      #ログインしていれば、用例を書くか、他の尻取りにするかを選択
      #これはバリデートの対象ではないのかもしれない
end
