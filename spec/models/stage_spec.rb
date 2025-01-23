require "rails_helper"

RSpec.describe Stage, type: :model do
  describe "Relationships:" do
    it {should have_many :shows}
    it {should have_many(:artists).through :shows}
  end
  describe "Validations:" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end