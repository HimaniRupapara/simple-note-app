class Note < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :skills, :interests # Alias for acts_as_taggable_on :tags

  belongs_to :user, :foreign_key => "created_by_id"
  has_many :comments

  validates :title,presence: true
  validates :description,presence: true



end
