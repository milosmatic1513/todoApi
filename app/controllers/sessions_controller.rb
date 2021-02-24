class SessionsController < ApplicationController
  before_action :set_current_user

  def logged_in
    if @current_user
        render json: {
          logged_in: true,
          user: @current_user.email
        },status: 200
    else
      render json: {
        logged_in: false
       },status: 200
    end
  end

  def login
    user = User
            .find_by(email: params["email"])
            .try(:authenticate, params["password"])

    if user

      session[:user_id] = user.id
      render json: {
        logged_in: true,
        user: user
      },status: :created

    else
      json_message("Invalid Request" , 401)
    end
  end

  def logout
    reset_session
    json_message("Logged Out" , 200)
  end

  private

  def user_params
    params.permit(:email,:password)
  end



end
