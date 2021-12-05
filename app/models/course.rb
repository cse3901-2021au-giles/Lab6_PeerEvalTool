class Course < ApplicationRecord
  belongs_to :instructor
  has_many :students
  #has_many :activities
  
  validates :name, presence: true, uniqueness: true
end
