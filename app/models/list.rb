class List < ApplicationRecord
  # Associations
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # validations
  validates :name, uniqueness: true,  presence: true
end
