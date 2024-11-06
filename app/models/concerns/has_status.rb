module HasStatus
  extend ActiveSupport::Concern
  included do
    #enum transparency: %i(anonymous private public) # this is an example
    enum status: { backlog: 0, in_progress: 1, done: 2 }
  end
end
