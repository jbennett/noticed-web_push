# TODO why is this not autoloading
require_relative "../../../app/helpers/noticed/web_push/application_helper"
require_relative "rails/routes"

module Noticed
  module WebPush
    class Engine < ::Rails::Engine
      isolate_namespace Noticed::WebPush

      ActiveSupport.on_load(:action_view) do
        include Noticed::WebPush::ApplicationHelper
      end

      config.after_initialize do
        Mime::Type.register "application/manifest+json", :webmanifest
      end
    end
  end
end
