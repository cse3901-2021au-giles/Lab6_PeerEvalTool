class Eval < ApplicationRecord
  #belongs_to :author, class_name: 'Student'
  #belongs_to :recipient, class_name: 'Student'
  #belongs_to :activity
  
  default_scope -> { order(created_at: :desc) }
  validates :student_id, presence: true
  validates :content, presence: true
end
