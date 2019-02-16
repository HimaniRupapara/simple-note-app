class Comment < ApplicationRecord
  belongs_to :note, :foreign_key => "commented_by_id"
  belongs_to :user, :foreign_key => "commented_by_id"

  validates :body,presence: true

end
