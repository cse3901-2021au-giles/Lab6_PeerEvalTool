class Team < ApplicationRecord
  #belongs_to :course
  has_many :projects, dependent: :destroy
  

end
