require "rails_helper"

RSpec.describe UserShow, type: :model do
  describe "Relationships:" do
    it {should have_many :user_shows}
    it {should have_many(:artists).through :shows}
  end
  describe "Validations:" do
    it {should validate_presence_of(:title)}
  end
end