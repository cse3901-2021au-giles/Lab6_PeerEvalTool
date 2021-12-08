class Project < ApplicationRecord
    #part of has many through relationship with assignments and groups
    #created by an admin user as an assignment that belongs to a course
    #distributed to all groups in the course
    belongs_to :course
    has_many :assignments
    has_many :groups, :through => :assignments
end
