json.extract! comment, :id, :body, :note_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
