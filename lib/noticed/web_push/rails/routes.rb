module ActionDispatch::Routing
  class Mapper
    def mount_web_push(path = "/web_push", skip_service_worker: false, skip_webmanifest: false)
      mount Noticed::WebPush::Engine => path
      get "/service_worker", to: "noticed/web_push/pwa#service_worker" unless skip_service_worker
      get "/app.webmanifest", to: "noticed/web_push/pwa#app_webmanifest", defaults: { format: :webmanifest } unless skip_webmanifest
    end
  end
end
