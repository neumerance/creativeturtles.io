module ApplicationHelper
  def action_cable_with_jwt_meta_tag(**identifiers)
    exp = Time.now.to_i + 60*5
    payload = {ext: serialize_identifiers(identifiers), exp: exp}

    token = JWT.encode payload, ENV["AUTH_SECRET"], "HS256"

    base_url = ActionCable.server.config.url || ActionCable.server.config.mount_path
    tag "meta", name: "action-cable-url", content: "#{base_url}?token=#{token}"
  end

  def serialize_identifiers(object)
    object.to_json
  end
end
