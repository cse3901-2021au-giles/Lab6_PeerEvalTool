class Team < ApplicationRecord
  has_many :student_teams
  has_many :students, :through => :student_teams
  belongs_to :instructor
  belongs_to :course
  has_many :projects, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
