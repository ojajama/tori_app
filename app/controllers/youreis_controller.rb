class YoureisController < ApplicationController
  before_action :test_user

  def show
    @yourei = Yourei.find(params[:id])
  end

  def create
    @word = Word.find(params[:word_id])
    @yourei = current_user.youreis.build(yourei_params)
    @yourei.word_id = @word.id
    if @yourei.save
      flash[:success] = '用例、追加。'
    else
      @youreis = @word.youreis.order('created_at DESC').page(params[:page])
      flash[:danger] = '用例、書き込んで！'
    end
    redirect_to @word
  end

  def edit
    @yourei = Yourei.find(params[:id])
  end

  def update
    @yourei = Yourei.find(params[:id])
    if @yourei.update(yourei_params)
      flash[:success] = '用例、直した。'
      redirect_to @yourei
    else
      flash.now[:danger] = '用例、直そう！'
      render :edit
    end
  end

  def destroy
    @yourei = Yourei.find(params[:id])
    @yourei.destroy

    flash[:success] = '用例、削除。'
    redirect_to words_url
   end

  private

  def yourei_params
    params.require(:yourei).permit(:content)
  end
end
