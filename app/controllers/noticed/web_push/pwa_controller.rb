class Noticed::WebPush::PwaController < ApplicationController
  skip_before_action :verify_authenticity_token

  def service_worker
    send_file get_full_path_to_asset("service_worker.js"), disposition: :inline
  end

  def app_webmanifest
    send_file get_full_path_to_asset("app.webmanifest"), disposition: :inline
  end

  private

  def get_full_path_to_asset(filename)
    manifest_file = Rails.application.assets_manifest.assets[filename]
    if manifest_file
      File.join(Rails.application.assets_manifest.directory, manifest_file)
    else
      Rails.application.assets&.[](filename)&.filename
    end
  end

end
