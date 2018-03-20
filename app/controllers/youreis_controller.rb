class YoureisController < ApplicationController

  def show
    @yourei = Yourei.find(params[:id])
  end

  def create
    @word = Word.find(params[:word_id])
    @yourei = @word.youreis.build(yourei_params)
    if @yourei.save
      flash[:success] = '用例を投稿しました。'
    else
      @youreis = @word.youreis.order('created_at DESC').page(params[:page])
      flash[:danger] = '用例の投稿に失敗しました。'
    end
    redirect_to @word
  end

  def destroy
  end

  private

  def yourei_params
    params.require(:yourei).permit(:content)
  end
end
