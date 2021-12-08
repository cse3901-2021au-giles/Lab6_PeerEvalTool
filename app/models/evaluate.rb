class Evaluate < ApplicationRecord
  #model for evals filled out by users
  #belongs to and is created by an admin user
  #has many ratings (averages the ratings from multiple teammates)
  belongs_to :user
  belongs_to :group
  belongs_to :project
  has_many :ratings
	
  validates :user_id, presence: true
  validates :ratee_id, presence: true
  validates :group_id, presence: true
end
