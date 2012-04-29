class CanvasController < ApplicationController
  layout 'canvas'
  before_filter :_shortening_from_shortened, only: :show

  def show
    unless @shortening
      render nothing: true, status: :not_found
    end
  end
end
