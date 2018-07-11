class RoomsController < ApplicationController
  def show
    # @dialogues = Dialogue.all.order(id: "ASC").page(params[:page]).per(50)
    # @dialogues = Dialogue.all.order(id: "ASC").page(params[:page])
    @dialogues = Dialogue.all.order(id: "ASC")
  end
end
