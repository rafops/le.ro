class CanvasController < ApplicationController
  layout 'canvas'
  before_filter :shortening_from_shortened, only: :show

  def show
    render nothing: true
    unless @shortening
      render nothing: true, status: :not_found
    end
  end
end
