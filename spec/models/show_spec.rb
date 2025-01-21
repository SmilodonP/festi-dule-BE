require "rails_helper"

RSpec.describe Show, type: :model do
  describe "Relationships:" do
    it { should belong_to(:stage) }
    it { should belong_to(:artist) }
  end

  describe "Validations:" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    
    it 'ensures end_time is after start_time' do
      stage = Stage.create!(name: 'Main Stage')
      artist = Artist.create!(name: 'Test Artist')

      show = Show.new(
        stage: stage,
        artist: artist,
        date: Date.today,
        start_time: '18:00',
        end_time: '17:00'
      )
      expect(show).not_to be_valid
      expect(show.errors[:end_time]).to include('must be after the start time')
    end
  end
  
end