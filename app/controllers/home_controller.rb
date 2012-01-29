class HomeController < ApplicationController
  def index
    @shortening = Shortening.new
  end

  def route
    @shortening = Shortening.find_by_shortened params[:shortened]
    if @shortening
      redirect_to @shortening.url, status: :moved_permanently 
    else
      render :nothing, status: :not_found
    end
  end
end
