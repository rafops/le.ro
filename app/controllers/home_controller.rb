class HomeController < ApplicationController
  def index
    @shortening = Shortening.new
  end
end
