class Membership < ApplicationRecord
	#model for has many through relationship between users and groups
	#allows admin user to add students to the groups they have created for their class
	has_many :memberships
	has_many :ratings
	has_many :groups, :through => :memberships
	has_many :courses
	has_many :evaluates

end
