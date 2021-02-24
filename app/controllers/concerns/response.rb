module Response
  def json_response(object, status =:ok)
    render json: object, status: status
  end
  def json_message(message, status =:ok)
    render json: {message: message}, status: status
  end
end
