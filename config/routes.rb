Noticed::WebPush::Engine.routes.draw do
  resources :subscriptions, only: :create
end
