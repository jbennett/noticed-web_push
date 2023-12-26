require "rails/generators/named_base"

module Noticed
  module WebPush
    module Generators
      class SampleFilesGenerator < Rails::Generators::Base
        source_root File.expand_path("../templates", __FILE__)

        def copy_manifest
          template "sample_app.webmanifest.tt", "public/sample_app.webmanifest"
        end

        def copy_web_push_js
          template "sample_web_push.js.tt", "public/sample_web_push.js"
        end

        def copy_service_worker_js
          template "sample_service_worker.js.tt", "public/sample_service_worker.js"
        end
      end
    end
  end
end
