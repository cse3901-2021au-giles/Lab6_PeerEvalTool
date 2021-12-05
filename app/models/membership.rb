class Membership < ApplicationRecord
  belongs_to :students
  belongs_to :teams
end
