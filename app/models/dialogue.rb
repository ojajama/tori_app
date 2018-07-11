class Dialogue < ApplicationRecord
  after_create_commit { DialogueBroadcastJob.perform_later self }

  validates :content, presence: true, length: { maximum: 511 }
end
