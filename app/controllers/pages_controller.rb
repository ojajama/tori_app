class PagesController < ApplicationController
  before_action :sign_in_require, only: [:show]
  before_action :test_user

  def index
    @word = Word.last
  end

  def new
  end

  def show
  end

end
