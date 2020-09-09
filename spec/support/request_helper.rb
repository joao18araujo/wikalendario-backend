module RequestHelper 
  def response_body
    JSON.parse(response.body)
  end

  def create_token(user)
    "Bearer #{jwt_and_refresh_token(user, 'user')[0]}"
  end
end
