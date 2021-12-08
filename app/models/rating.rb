class Rating < ApplicationRecord
    #belongs to a user, allows user to rate their teammates on a number scale
    #saved to the eval model and displayed as an average for each user
    belongs_to :user
    belongs_to :evaluate
    
    validates :evaluate_id, presence: true
    validates :user_id, presence: true
    validates :group_id, presence: true
    validates :comments, presence: true
end
