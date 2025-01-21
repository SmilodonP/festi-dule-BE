require "rails_helper"

RSpec.describe UserShow, type: :model do
  describe "Relationships:" do
    it { should belong_to :show }
    it { should belong_to :user }
  end
  describe "Validations:" do
    it {should validate_presence_of(:title)}
  end
end