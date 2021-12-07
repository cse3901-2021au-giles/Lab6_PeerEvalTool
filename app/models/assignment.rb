class Assignment < ApplicationRecord
    #model for has many through relationship between projects and groups
    belongs_to :project
    belongs_to :group
end
