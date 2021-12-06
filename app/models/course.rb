class Course < ApplicationRecord
  belongs_to :instructor
  has_many :teams
  has_many :projects
  
  validates :name, presence: true, uniqueness: true
end
