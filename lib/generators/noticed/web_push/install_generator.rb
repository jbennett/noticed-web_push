module Noticed
  module WebPush
    module Generators
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path("../templates", __FILE__)

        def add_javascript_deps
          run "yarn add github:jbennett/noticed-web_push"
          append_to_file File.join("app", "javascript", "application.js") do
            <<~INIT

            import * as web_push from "noticed-web_push/web_push"
            web_push.start({
              mounted_path: "/web_push",
              server_worker_path: "/service_worker.js"
            })
            INIT
          end
        end

        def setup_service_worker
          run "touch app/javascript/service_worker.js"
          append_to_file File.join("app", "javascript", "service_worker.js") do
            <<~INIT
            import {start} from "noticed-web_push/service_worker"
            start({
              mounted_path: "/web_push",
            })
            INIT
          end
          append_to_file "config/initializers/assets.rb", "Rails.application.config.assets.precompile += %w( service_worker.js )"
        end

        def create_webmanifest
          template "app.webmanifest.tt", "app/assets/webmanifests/app.webmanifest"
          append_to_file "app/assets/config/manifest.js", "//= link_tree ../webmanifests"
        end

        def update_rubies
          inject_into_file "app/models/user.rb", after: "has_many :notifications, as: :recipient, dependent: :destroy\n" do
            "\thas_many :web_push_subscriptions, class_name: \"Noticed::WebPush::Subscription\", dependent: :destroy\n"
          end
          route "mount_web_push \"/web_push\", :service_worker, :webmanifest\n"

          inject_into_file "app/views/layouts/application.html.erb", before: "</head>" do
            <<~INIT

            \t\t<%= link_tag rel: :manifest, href: "/app.webmanifest" %>
            \t\t<%= web_push_public_key_meta_tag %>
            INIT
          end
          inject_into_file "app/views/layouts/application.html.erb", after: "<body>\n" do
            "\t\t<button id=\"enable_notifications\" style=\"display: none\">Enable Notifications</button>\n"
          end
        end
      end
    end
  end
end
