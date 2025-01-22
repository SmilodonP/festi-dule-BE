class Api::V1::Admin::UsersController < ApplicationController
  def index
    if params[:query].present?
      @users = User.where('first_name ILIKE ?
                        OR last_name ILIKE ?
                        OR username ILIKE ? 
                        OR email ILIKE ?', 
                        "%#{params[:query]}%",
                        "%#{params[:query]}%",
                        "%#{params[:query]}%",
                        "%#{params[:query]}%")
    else
      @users = User.all.order('LOWER(username)')
    end

    render json: UserSerializer.format_users(@users)
  end

  def show
    @user = User.find(params[:id])
    render json: UserSerializer.format_user(@user)
  end
end