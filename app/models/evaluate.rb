class Evaluate < ApplicationRecord
<<<<<<< HEAD
    belongs_to :user
    belongs_to :group
    has_many :ratings
      
    validates :user_id, presence: true
    validates :ratee_id, presence: true
    validates :group_id, presence: true
=======
  belongs_to :user
  belongs_to :group
  has_many :ratings
	
  validates :user_id, presence: true
  validates :ratee_id, presence: true
  validates :group_id, presence: true
>>>>>>> 43d7c4a333ba1e5f2c3782b723a3a2c8dd3c64e6
end
