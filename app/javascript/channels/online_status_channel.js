import consumer from "channels/consumer"

consumer.subscriptions.create("OnlineStatusChannel", {
  connected() {
    console.log("WSS connected");
  },

  disconnected() {
    console.log("WSS disconnected");
  },

  received(data) {
    debugger;
    const userElement = document.getElementById(`online-indicator-${data.user_id}`);
    if (userElement) {
      if (data.status === 'online') {
        userElement.classList.add('online-indicator--online');
      } else {
        userElement.classList.remove('online-indicator--online');
      }
    }
  }
});
