class SharedNote < ApplicationRecord
  belongs_to :note
  belongs_to :permission
  belongs_to :user, :foreign_key => "shared_by_id"
end
