class Eval < ApplicationRecord
  belongs_to :student
  default_scope -> { order(created_at: :desc) }
  validates :student_id, presence: true
  validates :content, presence: true
end
