class Student < ApplicationRecord
  #has_many :author_evals, class_name: 'Eval', foreign_key: 'author_id'
  #has_many :recipient_evals, class_name: 'Eval', foreign_key: 'recipient_id'
  #belongs_to :team
  #belongs_to :instructor
  #belongs_to :course
  has_many :projects
  has_many :teams
    
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  #validates :password, presence: true, length: { minimum: 6 }
end
