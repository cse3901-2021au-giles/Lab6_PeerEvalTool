class Project < ApplicationRecord
    belongs_to :course
    has_many :assignments
    has_many :groups, :through => :assignments
end
