module Noticed
  module WebPush
    module Generators
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path("../templates", __FILE__)

        def add_javascript_deps
          run "yarn add github:jbennett/noticed-web_push"
          inject_into_file File.join("app", "javascript", "application.js") do
            <<~INIT
            import * as web_push from "noticed-web_push/web_push"
            web_push.start({
              mounted_path: "/web_push",
              server_worker_path: "/service_worker.js"
            })
            INIT
          end
        end

        # - javascript
        #   - add to package
        #   - add to application.js
        # - service worker
        #   - add entry point file
        #   - add to assests precompile
        # - webmanifest
        #   - mk asset dir
        #   - make sample
        # - ruby
        #   - add subscriptions to user
        #   - add routes helper
        #   - add to layout (helper + webmanifest)
      end
    end
  end
end
