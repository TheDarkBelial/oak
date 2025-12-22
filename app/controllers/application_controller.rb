class ApplicationController < ActionController::Base
  include Pagy::Method

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  around_action :set_time_zone

  add_flash_types :info, :success, :warning, :error

  rescue_from StandardError do |error|
    handle_error(error, status: 500)
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    handle_error(error, status: 404)
  end

  protected

  def pagy_options
    { page: params.expect(:page), limit: 10 }
  rescue ActionController::ParameterMissing
    { page: 1, limit: 10 }
  end

  private

  def set_time_zone(&block)
    Time.use_zone(Setting["time_zone"], &block)
  end

  def handle_error(error, status:)
    Rails.logger.error(error.full_message)
    raise if Rails.env.development?

    redirect_to error_path(status)
  end
end
