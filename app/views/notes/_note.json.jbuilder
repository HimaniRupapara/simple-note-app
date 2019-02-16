json.extract! note, :id, :title, :descriptin, :active, :important, :created_at, :updated_at
json.url note_url(note, format: :json)
