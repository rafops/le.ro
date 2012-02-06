class CanvasController < ApplicationController
  layout 'canvas'

  def index
    @url = params[:url]
  end
end
