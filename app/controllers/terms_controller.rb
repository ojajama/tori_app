class TermsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    @term = Term.create(params.require(:term).permit(:user_id, :content, :team_id).merge(:user_id => current_user.id))
    redirect_back(fallback_location: root_path)
  end

end
