Rails.application.routes.draw do
  mount Noticed::WebPush::Engine => "/noticed-web_push"
end
