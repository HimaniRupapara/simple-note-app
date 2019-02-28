class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :notes, :foreign_key => "created_by_id"
  has_many :comments, :foreign_key => "commented_by_id"
  has_many :shared_notes, :foreign_key => "shared_by_id"
  has_one_attached :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


end
