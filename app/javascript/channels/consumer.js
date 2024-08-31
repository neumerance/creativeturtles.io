// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `bin/rails generate channel` command.

import { createConsumer } from "@rails/actioncable"

const currentUserMetaTag = document.querySelector('meta[name="current_user"]');
const currentUserId = currentUserMetaTag ? currentUserMetaTag.getAttribute('content') : null;

export default createConsumer(`ws://localhost:8080/cable?user_id=${currentUserId}`)
