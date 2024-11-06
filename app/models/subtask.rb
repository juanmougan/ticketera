class Subtask < ApplicationRecord
  belongs_to :story, optional: true
end
