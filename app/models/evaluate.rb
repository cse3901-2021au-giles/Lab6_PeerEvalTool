class Evaluate < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :ratings
      
    validates :user_id, presence: true
    validates :ratee_id, presence: true
    validates :group_id, presence: true
end
