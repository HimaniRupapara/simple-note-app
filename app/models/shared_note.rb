class SharedNote < ApplicationRecord
  belongs_to :note, dependent: :destroy
  belongs_to :permission
  belongs_to :user, dependent: :destroy,:foreign_key => "shared_by_id"
end
