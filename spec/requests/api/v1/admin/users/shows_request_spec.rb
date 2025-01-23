require 'rails_helper'

RSpec.describe "User Shows Request Endpoints:", type: :request do
  let!(:user) { create(:user) }
  let!(:show) { create(:show) }
  let!(:user_show) { create(:user_show, user: user, show: show) }

  describe "DELETE - destroy user_show" do
    it "deletes the user_show successfully" do
      expect(UserShow.count).to eq(1)
      expect {
        delete "/api/v1/admin/users/#{user.id}/shows/#{show.id}", headers: { "ACCEPT" => "application/json" }
      }.to change(UserShow, :count).by(-1)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Show successfully removed from user's schedule.")
    end

    it "returns an error if the show is not found" do
      delete "/api/v1/admin/users/#{user.id}/shows/999", headers: { "ACCEPT" => "application/json" }

      expect(response).to have_http_status(:not_found)
      expect(response.body).to include("User's Show not found.")
    end
  end
end
