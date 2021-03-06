class YoureisController < ApplicationController
  before_action :test_user

  def index
    @Youreis = Yourei.all
    @words = Word.all.order(id:"DESC").page(params[:page]).per(50)
  end

  def show
    @yourei = Yourei.find(params[:id])
    @word = @yourei.word
  end

  def create
    @word = Word.find(params[:word_id])
    @yourei = current_user.youreis.build(yourei_params)
    @yourei.word_id = @word.id
    if @yourei.save
      flash[:success] = '例文、追加。'
    else
      @youreis = @word.youreis.order('created_at DESC').page(params[:page])
      flash[:danger] = '例文、書いて...'
    end
    redirect_to @word
  end

  def edit
    @yourei = Yourei.find(params[:id])
  end

  def update
    @yourei = Yourei.find(params[:id])
    if @yourei.update(yourei_params)
      flash[:success] = '例文、直した。'
      redirect_to @yourei
    else
      flash.now[:danger] = '例文、直そう！'
      render :edit
    end
  end

  def destroy
    @yourei = Yourei.find(params[:id])
    @yourei.destroy

    flash[:success] = '例文、削除。'
    redirect_to words_url
  end

  private

  def yourei_params
    params.require(:yourei).permit(:content, :category)
  end
end
