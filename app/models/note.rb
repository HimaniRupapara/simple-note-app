class Note < ApplicationRecord


  belongs_to :user, :foreign_key => "created_by_id"
  has_many :comments


  acts_as_taggable
  acts_as_taggable_on :skills, :interests # Alias for acts_as_taggable_on :tags

  validates :title,presence: true
  validates :description,presence: true



end
