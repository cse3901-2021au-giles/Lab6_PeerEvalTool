class User < ApplicationRecord

  has_many :memberships
  has_many :ratings
  has_many :groups, :through => :memberships
  has_many :courses
  has_many :evaluates

<<<<<<< HEAD
=======
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

>>>>>>> 43d7c4a333ba1e5f2c3782b723a3a2c8dd3c64e6
  before_save { email.downcase! }
  validates :Fname, presence: true, length: { maximum: 50 }
  validates :Lname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
end
