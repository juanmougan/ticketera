module HasStatus
  extend ActiveSupport::Concern
  included do
    enum :status, { backlog: 0, to_do: 1, in_progress: 2, done: 3 }
  end
end
