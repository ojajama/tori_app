class Team < ApplicationRecord
  has_many :sametimes
  has_many :terms, through: :sametimes, :source => :user
end
