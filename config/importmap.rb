# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "masonry-layout" # @4.2.2
pin "desandro-matches-selector" # @2.0.2
pin "ev-emitter" # @1.1.1
pin "fizzy-ui-utils" # @2.0.7
pin "get-size" # @2.0.3
pin "outlayer" # @2.1.1
pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
pin "dropzone" # @6.0.0
pin "just-extend" # @5.1.1

