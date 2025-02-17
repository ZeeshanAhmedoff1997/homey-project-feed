class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!, :append_flash_to_turbo_stream
  allow_browser versions: :modern

  private

  def append_flash_to_turbo_stream
    return unless request.format.turbo_stream?

    flash.each do |type, message|
      turbo_stream.append "flash", partial: "shared/flash", locals: { type: type, message: message }
    end

    flash.clear
  end
end
