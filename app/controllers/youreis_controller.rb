class YoureisController < ApplicationController

  def show
    @yourei = Yourei.find(params[:id])
  end

  def create
    @word = Word.find(params[:word_id])
    @yourei = @word.user.youreis.build(yourei_params)
    @yourei.word_id = @word.id
    if @yourei.save!
      flash[:success] = '使い方、追加！'
    else
      @youreis = @word.youreis.order('created_at DESC').page(params[:page])
      flash[:danger] = '他の、使い方を！'
    end
    redirect_to @word
  end

  def edit
    @yourei = Yourei.find(params[:id])
  end

  def update
    @yourei = Yourei.find(params[:id])
    if @yourei.update(yourei_params)
      flash[:success] = '他の、使い方'
      redirect_to @yourei
    else
      flash.now[:danger] = '使い方、書き直す！'
      render :edit
    end
  end

  def destroy
    @yourei = Yourei.find(params[:id])
    @yourei.destroy

    flash[:success] = 'この使い方、消す'
    redirect_to words_url
   end

  private

  def yourei_params
    params.require(:yourei).permit(:content)
  end
end
