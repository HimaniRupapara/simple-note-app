class Comment < ApplicationRecord
  belongs_to :note
  belongs_to :user, :foreign_key => "commented_by_id"

  validates :body,presence: true

end
