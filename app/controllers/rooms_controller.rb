class RoomsController < ApplicationController
  def show
    # @dialogues = Dialogue.all.order(id: "ASC").page(params[:page]).per(50)
    # @dialogues = Dialogue.all.order(id: "ASC").page(params[:page])
    @dialogues = Dialogue.all
  end

  def index
    @dialogues = Dialogue.all
    respond_to do |format|
      format.html
      format.csv { send_data @dialogues.to_csv }
    end
  end
end
