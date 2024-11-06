json.extract! story, :id, :title, :description, :status, :due_date, :points, :epic_id, :created_at, :updated_at
json.url story_url(story, format: :json)
