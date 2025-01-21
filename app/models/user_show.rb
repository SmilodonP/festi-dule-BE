class UserShow < ApplicationRecord
  belongs_to :user
  belongs_to :show

  validates :title, presence: true
end
