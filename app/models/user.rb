class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable
  has_many :notes, dependent: :destroy, :foreign_key => "created_by_id"
  has_many :comments, :foreign_key => "commented_by_id"

  has_many :shared_notes, :foreign_key => "shared_by_id"
  has_many :sharenotes, through: :shared_notes ,:source => "note"

  has_one_attached :profile

end
