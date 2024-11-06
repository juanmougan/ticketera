json.extract! subtask, :id, :title, :description, :status, :due_date, :story_id, :created_at, :updated_at
json.url subtask_url(subtask, format: :json)
