require 'rails_helper'

RSpec.describe Api::V1::Admin::UsersController, type: :request do
  describe "HTTP Request Endpoints:" do
    context "#Index - Get All Users - No Search Params" do
      let!(:user1) { create(:user, username: "AnthraxLover") }
      let!(:user2) { create(:user, username: "Beelzebub") }
      let!(:user3) { create(:user, username: "CreedSux") }

      it "returns a successful response" do
        get "/api/v1/admin/users"
        expect(response).to have_http_status(:ok)
      end

      it "returns the correct list of users organized alphabetically by username" do
        get "/api/v1/admin/users"
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data].size).to eq(3)
        usernames = parsed_response[:data].map { |user| user[:attributes][:username] }
        expect(usernames).to eq(["AnthraxLover", "Beelzebub", "CreedSux"])
      end
    end

    context "#Index - Search Users" do
      let!(:user1) { User.create!(first_name: 'First', last_name: 'Person', username: 'number1', email: '1@example.com') }
      let!(:user2) { User.create!(first_name: 'Second', last_name: 'Person', username: 'NumberTwo', email: '2@example.com') }
      let!(:user3) { User.create!(first_name: 'Third', last_name: 'Person', username: 'Tre333', email: '3@example.com') }

      it "allows searching for users by first name" do
        get "/api/v1/admin/users", params: { query: "first" }
        expect(response).to have_http_status(:success)

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data].size).to eq(1)
        expect(parsed_response[:data].first[:attributes][:username]).to eq("number1")
      end

      it "allows searching for users by first name regardless of case" do
        get "/api/v1/admin/users", params: { query: "SECOND" }
        expect(response).to have_http_status(:success)

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data].size).to eq(1)
        expect(parsed_response[:data].first[:attributes][:username]).to eq("NumberTwo")
      end

      it "allows searching for users by username regardless of case" do
        get "/api/v1/admin/users", params: { query: "numbertwo" }
        expect(response).to have_http_status(:success)

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data].size).to eq(1)
        expect(parsed_response[:data].first[:attributes][:username]).to eq("NumberTwo")
      end

      it "allows searching for users by last name regardless of case" do
        get "/api/v1/admin/users", params: { query: "person" }
        expect(response).to have_http_status(:success)

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data].size).to eq(3)
        usernames = parsed_response[:data].map { |user| user[:attributes][:username] }
        expect(usernames).to eq(["number1", "NumberTwo", "Tre333"])
      end

      it "allows searching for users by email regardless of case" do
        get "/api/v1/admin/users", params: { query: "3@exAMPLE.com" }
        expect(response).to have_http_status(:success)

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data].size).to eq(1)
        expect(parsed_response[:data].first[:attributes][:username]).to eq("Tre333")
      end

      it "allows searching for users by partial input regardless of case" do
        get "/api/v1/admin/users", params: { query: "rson" }
        expect(response).to have_http_status(:success)

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(parsed_response[:data].size).to eq(3)
        usernames = parsed_response[:data].map { |user| user[:attributes][:username] }
        expect(usernames).to eq(["number1", "NumberTwo", "Tre333"])
      end

      context 'when no search query is provided' do
        it 'returns all users sorted by username' do
          get "/api/v1/admin/users"
          expect(response).to have_http_status(:success)

          parsed_response = JSON.parse(response.body, symbolize_names: true)
          usernames = parsed_response[:data].map { |user| user[:attributes][:username] }
          expect(usernames).to eq(["number1", "NumberTwo", "Tre333"])
        end
      end
    end
  end
end
