class Dialogue < ApplicationRecord
  after_create_commit { DialogueBroadcastJob.perform_later self }
end
