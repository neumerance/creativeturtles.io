class OnlineStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_status_channel"
    
    if current_user.present? && !current_user.online?
      current_user.update(online: true)
      broadcast_user_status(current_user, 'online')
    end
  end

  def unsubscribed
    if current_user.present? && current_user.online?
      current_user.update(online: false)
      broadcast_user_status(current_user, 'offline')
    end
  end

  private

  def broadcast_user_status(user, status)
    ActionCable.server.broadcast("online_status_channel", { user_id: user.id, status: status })
  end
end
