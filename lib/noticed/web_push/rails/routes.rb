module ActionDispatch::Routing
  class Mapper
    def mount_web_push(*resources)
      puts resources.inspect
      puts "hello from webpush"

      mount Noticed::WebPush::Engine => "/web_push"
      get "/service_worker", to: "noticed/web_push/pwa#service_worker"
      get "/app.webmanifest", to: "noticed/web_push/pwa#app_webmanifest"
    end
  end
end
