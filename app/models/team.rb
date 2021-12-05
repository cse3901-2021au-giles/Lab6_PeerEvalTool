class Team < ApplicationRecord
  #belongs_to :course
  has_many :projects, dependent: :destroy
  has_many :students_teams
  has_many :students, :through => :students_teams
  belongs_to :instructor
  belongs_to :course

  validates :name, presence: true, length: { maximum: 50 }
end
