class RoomsController < ApplicationController
  def show
    @dialogues = Dialogue.all
  end
end
