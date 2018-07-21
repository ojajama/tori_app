require 'csv'

class Dialogue < ApplicationRecord
  after_create_commit { DialogueBroadcastJob.perform_later self }

  has_many :groups

  validates :content, presence: true, length: { maximum: 511 }

  def self.to_csv
    CSV.generate(encoding: Encoding::SJIS) do |csv|
      csv << column_names
      all.each do |dialogue|
        csv << dialogue.attributes.values_at(*column_names)
      end
    end
  end
end
