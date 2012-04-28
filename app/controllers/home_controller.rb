class HomeController < ApplicationController
  layout 'home'

  def index
    # http://www.alanwood.net/unicode/miscellaneous_symbols.html
    @chars = [ 9728, 9730, 9733, 9742, 9749, 9752, 9760, 9762, 9756, 9773,
               9774, 9786, 9793, 9822, 9827, 9829, 9830, 9835 ]
    @shortening = Shortening.new
  end

  def route
    @shortening = Shortening.find_by_shortened params[:shortened]
    if @shortening
      redirect_to @shortening.url, status: :moved_permanently 
    else
      render :nothing, status: :not_found
    end
# TODO if canvalized, show canvas instead redirect
  end
end
