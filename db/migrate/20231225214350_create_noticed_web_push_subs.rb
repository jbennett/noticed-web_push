class CreateNoticedWebPushSubs < ActiveRecord::Migration[7.1]
  def change
    create_table :noticed_web_push_subscriptions do |t|
      t.references :user, polymorphic: true, null: false
      t.string :endpoint, null: false
      t.string :auth_key, null: false
      t.string :p256dh_key, null: false

      t.timestamps
    end
  end
end
