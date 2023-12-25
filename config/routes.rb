Noticed::WebPush::Engine.routes.draw do
  resources :subscriptions, onyl: :create
end
