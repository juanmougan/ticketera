class Bug < ApplicationRecord
  belongs_to :story, optional: true
  belongs_to :sprint, optional: true
  include HasStatus
  enum :severity, { low: 0, medium: 1, high: 2, critical: 3 }
end
