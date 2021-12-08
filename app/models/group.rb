class Group < ApplicationRecord
	#created by an admin user, for a specific course they are teaching
	#has many users through the memberships model
	#has many projects through the assignments model
	has_many :memberships
	has_many :evaluates
	has_many :users, :through => :memberships
	belongs_to :course
	has_many :assignments
	has_many :projects, :through => :assignments
	
	validates :gname, presence: true, length: { maximum: 50 }
	validates :course_id, presence: true
	validates :user_id, presence: true
end
