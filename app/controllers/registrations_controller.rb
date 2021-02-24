class RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)
    if user
      session[:user_id] = user.id
      json_response(user , :created)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def user_params
    params.permit(:email,:password,:password_confirmation)
  end

end
