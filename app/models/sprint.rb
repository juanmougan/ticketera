class Sprint < ApplicationRecord
  enum :status, { draft: 0, future: 1, current: 2, past: 3 }

  has_many :stories
  has_many :bugs

  # Fetches tasks in stored order
  def ordered_tasks
    (task_order || []).map { |task_id| Story.find_by(id: task_id) || Bug.find_by(id: task_id) }.compact
  end

  # Adds a new task ID to the order
  def add_task(task)
    self.task_order << task.id
    save
  end

  # Reorders tasks within the sprint
  def reorder_tasks(new_order)
    self.task_order = new_order
    save
  end
end
