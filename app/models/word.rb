class Word < ApplicationRecord
  belongs_to :user
  has_many :youreis

  validates :user_id, presence: true
  validates :content, presence: true,
      format: { with: /\A[ぁ-ゞァ-ヾ]{1,128}\z/, on: :create }
  validates :content, uniqueness: true, if: :nanashi?
      def nanashi?
         user.username == "名無しの権兵衛"
         #errors.add :base, "もうあります。他のことばにするか、登録またはログインして！"
         #いったんここにはまると、ずっと。どうやって抜けるのか。
      #   else
         #  errors.add(:word, "もうあります。他のことばにするか、用例を書いて！")
      #     #当該用例集にリンク
      #     #前提として、同語の用例は同じページにまとめたい
        #end
      end
  validates :category, length: { maximum: 255 }
    #重複があったら、
      #登録・ログインしていなければ、登録・ログインするか、他の尻取りにするかを選択、
      #ログインしていれば、用例を書くか、他の尻取りにするかを選択
      #これはバリデートの対象ではないのかもしれない

      # # これは悲観的ロックなのか？コンフリクトが起こる可能性がある作成処理
       # def create_with_conflict_validation(*args)
       #   create(*args)
       # rescue ActiveRecord::StaleObjectError
       #   self.lock_version = lock_version_was
       #   errors.add :base, "あなたが考えてるあいだに他の人が尻取りしちゃった。"
       #   changes.except("created_at").each do |content, values|
       #     errors.add content, "was #{values.first}"
       #   end
       #   false
       # end

end
