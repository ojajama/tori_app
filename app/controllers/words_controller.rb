class WordsController < ApplicationController
  def index
    @words = Word.all.order(id:"DESC").page(params[:page]).per(30)
    @word = Word.new(content: '前の語のしっぽ')
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
  end

  def create
    @word = current_user.words.build(word_params)

    if @word.save
      flash[:success] = '尻取りが正常に投稿されました'
      redirect_to words_path
    else
      flash.now[:danger] = '尻取りが投稿されませんでした'
      redirect_to words_path
#      render :new
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])

    if @word.update(word_params)
      flash[:success] = '尻取りは正常に更新されました'
      redirect_to @word
    else
      flash.now[:danger] = '尻取りは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    flash[:success] = '尻取りは正常に削除されました'
    redirect_to words_url
   end

  private

  # Strong Parameter
  def word_params
    params.require(:word).permit(:content)
  end
end
