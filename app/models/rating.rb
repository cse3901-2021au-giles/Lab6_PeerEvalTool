class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :evaluate
  
  validates :evaluate_id, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true
end
