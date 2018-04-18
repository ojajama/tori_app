class Word < ApplicationRecord
  belongs_to :user
  has_many :youreis

  validates :user_id, presence: true
  validates :content, presence: true#, if: :kara?
      # def kara?
      #   errors.add :base, "空っぽです。"
      # end
  validates :content, format: { with: /\A[ぁ-ゞァ-ヾ]{1,128}\z/, on: :create }, if: ->(u) { u.content.present? }
  #, if: :moji?
      # def moji?
      #   errors.add :base, "平仮名か片仮名で。"
      # end
  validates :content, uniqueness: true, if: :nanashi?
      def nanashi?
         # if user.username == "名無しの権兵衛"
         user.username == "名無しの権兵衛"
         #errors.add :base, "この尻取りはもうあります。登録またはログインを..."
         # else
         # errors.add :base, "この尻取りはもうあります。用例を書いて！"
         # end
      end
  validates :category, length: { maximum: 255 }

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
