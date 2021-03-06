class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:confirmable, :lockable, :timeoutable

  #before_save { self.email.downcase! }
  #validates :name, presence: true, length: { maximum: 50 }
  #validates :email, presence: true, length: { maximum: 255 },
                  #format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                  #uniqueness: { case_sensitive: false }
  #has_secure_password

  validates :username, presence: true, length: { maximum: 255 },
                       uniqueness: true

  has_many :words
  has_many :youreis

  has_many :groups
  has_many :dialogues, through: :groups

  has_many :sametimes
  has_many :terms, through: :sametimes

end
