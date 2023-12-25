module Noticed
  module WebPush
    module ApplicationHelper

      def web_push_public_key_meta_tag(web_push_public_key: Rails.application.credentials.dig(:web_push, :public_key))
        tag.meta name: "web_push_public", content: Base64.urlsafe_decode64(web_push_public_key).bytes.to_json
      end
    end
  end
end
