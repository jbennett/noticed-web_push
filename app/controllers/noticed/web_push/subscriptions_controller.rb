# frozen_string_literal: true

class Noticed::WebPush::SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
      Noticed::WebPush::Subscription.find_or_create_by!(user: current_user, endpoint: params[:endpoint], auth_key: params[:keys][:auth], p256dh_key: params[:keys][:p256dh])

      head :ok
  end
end

# TODO
# - replace AppController
# - replace current_user