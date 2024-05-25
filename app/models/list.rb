class List < ApplicationRecord
  # Associations
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # validations
  validates :name, uniqueness: true,  presence: true

  # image storage 
  has_one_attached :photo
end
