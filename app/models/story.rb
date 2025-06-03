class Story < ApplicationRecord
  include HasStatus
  belongs_to :epic, optional: true
  belongs_to :sprint, optional: true
  has_many :subtasks
end
