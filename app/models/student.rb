class Student < ApplicationRecord
  belongs_to :team
  belongs_to :instructor
  belongs_to :course
  has_many :author_evals, class_name: 'Eval', foreign_key: 'author_id'
  has_many :recipient_evals, class_name: 'Eval', foreign_key: 'recipient_id'
end
