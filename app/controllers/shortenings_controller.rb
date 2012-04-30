class ShorteningsController < ApplicationController
  before_filter :shortening_from_shortened, only: :show
  before_filter :protect_from_self_redirect, only: :show

  def show
    if @shortening
      redirect_to @shortening.url, status: :moved_permanently 
    else
      render nothing: true, status: :not_found
    end
  end

  def create
    @shortening = Shortening.new params[:shortening]
    if @shortening.save
      render json: { s: @shortening.shortened }
    else
      if @shortening.errors.messages.empty?
        render nothing: true, status: :service_unavailable
      else
        render json: @shortening.errors.messages, status: :precondition_failed
      end
    end
  end

  protected

  def protect_from_self_redirect
    if @shortening and @shortening.url.index(request.env["SERVER_NAME"])
      redirect_to root_path
    end
    return false
  end
end
