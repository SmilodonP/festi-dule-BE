require "rails_helper"

RSpec.describe User, type: :model do
  describe "Relationships:" do
    it {should have_many :user_shows}
    it {should have_many(:shows).through :user_shows}
  end
  describe 'Validations:' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:username).case_insensitive }

    it { should allow_value('test@example.com').for(:email) }
    it { should allow_value('user.name+alias@domain.co').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
    it { should_not allow_value('missing@domain').for(:email) }
    it { should_not allow_value('user@domain,com').for(:email) }
    it { should_not allow_value('user@.com').for(:email) }
  end

  describe 'email format validation' do
    let(:valid_email_user) { User.new(first_name: 'Bruce', last_name: 'Dickenson', username: 'AcesHigh', email: 'valid@example.com') }
    let(:invalid_email_user) { User.new(first_name: 'Dave', last_name: 'Brockie', username: 'OdorusUrungusLives', email: 'invalid_email') }

    it 'accepts valid email formats' do
      expect(valid_email_user).to be_valid
    end

    it 'rejects invalid email formats' do
      expect(invalid_email_user).not_to be_valid
      expect(invalid_email_user.errors[:email]).to include('is invalid')
    end

    it "rejects duplicate email" do
      create(:user, email: "duplicate@example.com")
      user = User.create!(username: "newuser", email: "duplicate@example.com")
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end