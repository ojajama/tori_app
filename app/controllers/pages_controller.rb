class PagesController < ApplicationController
  before_action :sign_in_require, only: [:show]
  def index
  end

  def new
  end

  def show
  end

end
