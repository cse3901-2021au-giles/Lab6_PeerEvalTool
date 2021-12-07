class Group < ApplicationRecord
<<<<<<< HEAD
	has_many :memberships
	has_many :evaluates
	has_many :users, :through => :memberships
	belongs_to :course
	has_many :assignments
	has_many :projects, :through =>assignments
	
	validates :gname, presence: true, length: { maximum: 50 }
	validates :course_id, presence: true
	validates :user_id, presence: true
=======
  has_many :memberships
  has_many :evaluates
  has_many :users, :through => :memberships
  belongs_to :course
  
  validates :gname, presence: true, length: { maximum: 50 }
  validates :course_id, presence: true
  validates :user_id, presence: true
>>>>>>> 43d7c4a333ba1e5f2c3782b723a3a2c8dd3c64e6
end
