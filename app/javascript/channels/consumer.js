// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `bin/rails generate channel` command.

import { createConsumer } from "@rails/actioncable"

const currentUserMetaTag = document.querySelector('meta[name="current_user"]');
const currentUserId = currentUserMetaTag ? currentUserMetaTag.getAttribute('content') : null;

const websocketUrlMetaTag = document.querySelector('meta[name="websocket_url"]');
const websocketUrl = websocketUrlMetaTag ? websocketUrlMetaTag.getAttribute('content') : "ws://localhost:8080";

export default createConsumer(`${websocketUrl}?user_id=${currentUserId}`)
