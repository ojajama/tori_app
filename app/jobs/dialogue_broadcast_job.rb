class DialogueBroadcastJob < ApplicationJob
  queue_as :default

  def perform(dialogue)
    ActionCable.server.broadcast 'room_channel', dialogue: render_dialogue(dialogue)
  end

  private
    def render_dialogue(dialogue)
      ApplicationController.renderer.render(partial: 'dialogues/dialogue', locals: { dialogue: dialogue})
    end
end
