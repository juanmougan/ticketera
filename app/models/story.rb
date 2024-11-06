class Story < ApplicationRecord
  belongs_to :epic, optional: true
  has_many :subtasks
end
