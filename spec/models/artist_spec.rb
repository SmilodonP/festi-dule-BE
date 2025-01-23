require "rails_helper"

RSpec.describe Artist, type: :model do
  describe "Relationships:" do
    it {should have_many :shows}
    it {should have_many(:stages).through :shows}
  end
  describe "Validations:" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end