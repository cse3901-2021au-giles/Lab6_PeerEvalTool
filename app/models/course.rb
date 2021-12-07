class Course < ApplicationRecord
    belongs_to :user
	has_many :groups
	
	validates :cname, presence: true, length: { maximum: 50 }
	validates :user_id, presence: true
end
