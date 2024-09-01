module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def connect
      token = request.params[:token]
      decoded_token = JWT.decode token, ENV["AUTH_SECRET"], true, { algorithm: "HS256" }
      identifiers = JSON.parse(decoded_token.first["ext"])
    
      self.current_user = User.find(identifiers.dig("current_user", "id"))
    rescue JWT::DecodeError => e
      Rails.logger.error "ERROR: #{e.to_json}"
      reject_unauthorized_connection
    end
  end
end
