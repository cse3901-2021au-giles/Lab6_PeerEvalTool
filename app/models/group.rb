class Group < ApplicationRecord
	has_many :memberships
	has_many :evaluates
	has_many :users, :through => :memberships
	belongs_to :course
	has_many :assignments
	has_many :projects, :through =>assignments
	
	validates :gname, presence: true, length: { maximum: 50 }
	validates :course_id, presence: true
	validates :user_id, presence: true
end
