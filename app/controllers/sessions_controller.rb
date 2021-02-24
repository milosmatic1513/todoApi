class SessionsController < ApplicationController
  before_action :set_current_user
  def create
    user = User
            .find_by(email: params["email"])
            .try(:authenticate, params["password"])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
        render json: {
          logged_in: true,
          user: @current_user.email
         }
    else
      render json: {
        logged_in: false
       }
    end
  end

  private

  def user_params
    params.permit(:email,:password)
  end

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

end
