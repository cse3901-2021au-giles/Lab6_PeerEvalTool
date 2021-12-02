class Course < ApplicationRecord
  belongs_to :user #instructor
  has_many :user #students
  has_many :activities
  # has_one :instructor
end
