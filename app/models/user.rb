class User < ApplicationRecord
  #model for admin users (instructors) and users (students)

  has_many :memberships
  has_many :ratings
  has_many :groups, :through => :memberships
  has_many :courses
  has_many :evaluates

  before_save { email.downcase! }
  validates :Fname, presence: true, length: { maximum: 50 }
  validates :Lname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
