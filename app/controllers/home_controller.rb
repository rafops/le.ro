class HomeController < ApplicationController
  layout 'home'

  def index
    # http://www.alanwood.net/unicode/miscellaneous_symbols.html
    @chars = [ 9728, 9730, 9733, 9742, 9749, 9752, 9760, 9762, 9756, 9773,
               9774, 9786, 9793, 9822, 9827, 9829, 9830, 9835 ]
    @shortening = Shortening.new
  end
end
