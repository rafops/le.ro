class HomeController < ApplicationController
  layout 'home'

  def index
    # http://www.alanwood.net/unicode/miscellaneous_symbols.html
    @chars = [ 9728, 9729, 9730, 9731, 9732, 9733, 9742, 9749, 9752, 9756,
               9760, 9762, 9763, 9765, 9773, 9774, 9786, 9793, 9822, 9824,
               9827, 9829, 9835, 9851, 9875, 9880, 9881 ]
    @shortening = Shortening.new
  end
end
