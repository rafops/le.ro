class CanvasController < ApplicationController
  layout 'canvas'
  before_filter :shortening_from_shortened, only: :show

  def index
    # render text: "<script>document.location='#{params[:url]}';</script>"
    #render text: "<script>document.location='http://terra.com.br';</script>"
    render text: Time.now
  end

  def show
    unless @shortening
      render nothing: true, status: :not_found
    end
  end
end
