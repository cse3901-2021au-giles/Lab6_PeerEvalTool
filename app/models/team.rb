class Team < ApplicationRecord
  belongs_to :course
  has_many :users #students
end
