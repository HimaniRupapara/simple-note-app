class Note < ApplicationRecord
  belongs_to :user, :foreign_key => "created_by_id"
  has_many :comments

  has_many :shared_notes
  has_many :users, through: :shared_notes

  acts_as_taggable
  

  validates :title,presence: true
  validates :description,presence: true

end
