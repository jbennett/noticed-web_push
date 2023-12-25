module Noticed
  module WebPush
    class Engine < ::Rails::Engine
      isolate_namespace Noticed::WebPush
    end
  end
end
