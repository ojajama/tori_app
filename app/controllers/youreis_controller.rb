class YoureisController < ApplicationController
#  before_action :require_user_logged_in
  def show
    @youreis = @word.youreis.order(id:"DESC").page(params[:page]).per(20)
  end

  def new
    @yourei = @word.youreis.build
  end

  def create
    @yourei = @word.youreis.build(yourei_params)
    if @yourei.save
      flash[:success] = '用例を投稿しました。'
      redirect_to words_path
    else
      @youreis = @word.youreis.order('created_at DESC').page(params[:page])
      flash[:danger] = '用例の投稿に失敗しました。'
      redirect_to words_path
    end
  end

  def destroy
  end

  private

  def yourei_params
    params.require(:yourei).permit(:content)
  end
end
