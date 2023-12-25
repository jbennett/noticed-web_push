# frozen_string_literal: true

require "noticed/web_push/version"
require "noticed/web_push/engine"
require "web_push"

module Noticed
  module DeliveryMethods
    autoload :WebPush, "noticed/delivery_methods/web_push"
  end

  module WebPush
    autoload :Subscription, "noticed/web_push/subscription"

    class Error < StandardError; end
    # Your code goes here...
  end
end
