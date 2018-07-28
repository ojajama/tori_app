class TeamsController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :show, :index, :edit, :update]

  def create
    @team = Team.create
    @sametime1 = Sametime.create(:team_id => @team.id, :user_id => current_user.id)
    @sametime2 = Sametime.create(params.require(:sametime).permit(:user_id, :team_id).merge(:team_id => @team.id))
    redirect_to @team
  end

  def show
    @team = Team.find(params[:id])
    @terms = @team.terms
    binding pry
    @term = Term.new
    @sametimes = @team.sametimes
  end

  def index
    @sametimes = current_user.sametimes
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(params.require(:team).permit(:vocabulary))
    redirect_back(fallback_location: root_path)
  end

end
