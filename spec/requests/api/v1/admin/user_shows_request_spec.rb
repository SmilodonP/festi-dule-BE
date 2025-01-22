require 'rails_helper'

RSpec.describe "UserShows", type: :request do
  let!(:user) { create(:user) }
  let!(:show) { create(:show) }
  let!(:user_show) { create(:user_show, user: user, show: show) }

  describe "DELETE /api/v1/admin/users/:user_id/user_shows/:id" do
    it "deletes the user_show successfully" do
      expect {
        delete "/api/v1/admin/users/#{user.id}/user_shows/#{user_show.id}", headers: { "ACCEPT" => "application/json" }
      }.to change(UserShow, :count).by(-1)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Show successfully removed from user's schedule.")
    end

    it "returns an error if the user_show is not found" do
      delete "/api/v1/admin/users/#{user.id}/user_shows/999", headers: { "ACCEPT" => "application/json" }

      expect(response).to have_http_status(:not_found)
      expect(response.body).to include("User's Show not found.")
    end
  end
end