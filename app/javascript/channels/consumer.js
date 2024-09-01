// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `bin/rails generate channel` command.

import { createConsumer } from "@rails/actioncable"

const websocketUrlMetaTag = document.querySelector('meta[name="action-cable-url"]');
const websocketUrl = websocketUrlMetaTag.getAttribute('content');

export default createConsumer(websocketUrl);

