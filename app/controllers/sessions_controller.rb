class SessionsController < ApplicationController
  def create
    user = User
      .find_by(email: params["email"])
      .try(:authenticate,params["password"])

    if user
      session[:user_id] = user.id
      json_response(user , :created)
    else
      head(:unprocessable_entity)
    end


  end

  private

  def user_params
    params.permit(:email,:password)
  end

end
