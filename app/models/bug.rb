class Bug < ApplicationRecord
  belongs_to :story, optional: true
  enum :severity, { low: 0, medium: 1, high: 2, critical: 3 }
end
