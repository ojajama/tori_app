class Group < ApplicationRecord
  belongs_to :user
  belongs_to :dialgue

  validates :user_id, presence: true
  validates :dialogue_id, presence: true
end
