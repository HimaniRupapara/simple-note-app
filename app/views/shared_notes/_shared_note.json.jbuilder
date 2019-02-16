json.extract! shared_note, :id, :email, :note_id, :permission_id, :created_at, :updated_at
json.url shared_note_url(shared_note, format: :json)
