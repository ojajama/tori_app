class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show, :index]

  def index
    @users = User.all
    @sametimes = current_user.sametimes
  end

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
       @sametimes = current_user.sametimes.limit(3)
    else
       @team = Team.new
       @sametime = Sametime.new
    end
  end
end
