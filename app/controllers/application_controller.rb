class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def shortening_from_shortened
    if params[:shortened] and @shortening = Shortening.find_by_shortened(params[:shortened])
      Visitor.create(number: @shortening.number,
                     remote_addr: request.env["REMOTE_ADDR"],
                     request_path: request.env["REQUEST_PATH"],
                     http_user_agent: request.env["HTTP_USER_AGENT"])
    end
  end
end
