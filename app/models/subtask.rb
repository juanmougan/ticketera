class Subtask < ApplicationRecord
  belongs_to :story, optional: true
  validates :title, presence: true
end
