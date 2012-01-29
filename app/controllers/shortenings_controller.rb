class ShorteningsController < ApplicationController
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
