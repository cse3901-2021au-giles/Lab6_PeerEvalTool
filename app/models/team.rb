class Team < ApplicationRecord
  #belongs_to :course
  has_many :projects, dependent: :destroy
  has_and_belongs_to_many :students
  belongs_to :instructor
  belongs_to :course

  validates :name, presence: true, length: { maximum: 50 }
end
