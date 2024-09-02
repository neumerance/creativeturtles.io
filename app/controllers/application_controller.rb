class ApplicationController < ActionController::Base
  def jwt_authenticate!
    token = request.headers["Authorization-Token"]
    decoded_token = JWT.decode token, ENV["AUTH_SECRET"], true, { algorithm: "HS256" }
    identifiers = JSON.parse(decoded_token.first["ext"])
  
    if identifiers.dig("current_user", "id").present?
      user = User.find(identifiers.dig("current_user", "id")) 
      sign_in user
    else
      render json: { errors: ["Unauthorize access!"] }, status: :unauthorized 
    end    
  end
end
