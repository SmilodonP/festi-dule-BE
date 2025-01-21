class Stage < ApplicationRecord
  has_many :shows
  has_many :artists, through: :shows

  validates :name, presence: true
end
