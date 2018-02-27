json.extract! todo_list, :id, :project_id, :description, :scheduled_to, :created_at, :updated_at
json.url todo_list_url(todo_list, format: :json)
