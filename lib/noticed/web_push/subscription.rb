class Noticed::WebPush::Subscription < ActiveRecord::Base
  self.table_name = "web_push_subscriptions"

  belongs_to :user # TODO: polymorphic
  encrypts :endpoint, deterministic: true
  encrypts :auth_key, deterministic: true
  encrypts :p256dh_key, deterministic: true

  def publish(data)
    WebPush.payload_send(
      message: data.to_json,
      endpoint: endpoint,
      p256dh: p256dh_key,
      auth: auth_key,
      vapid: {
        private_key: Rails.application.credentials.dig(:web_push, :private_key),
        public_key: Rails.application.credentials.dig(:web_push, :public_key)
      }
    )
  end
end
