class Api::V1::Admin::Users::ShowsController < ApplicationController
  def destroy
    user_show = UserShow.find_by(user_id: params[:user_id], show_id: params[:id])

    if user_show
      user_show.destroy
      render json: { message: "Show successfully removed from user's schedule." }, status: :ok
    else
      render json: { error: "User or Show not found." }, status: :not_found
    end
  end
end
