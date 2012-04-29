class ShorteningsController < ApplicationController
  before_filter :_shortening_from_shortened, only: :show

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
end
