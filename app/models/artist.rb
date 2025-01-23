class Artist < ApplicationRecord
  has_many :shows
  has_many :stages, through: :shows

  validates :name, presence: true, uniqueness: true
end
