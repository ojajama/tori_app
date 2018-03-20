class WordsController < ApplicationController
  def index
    @words = Word.all.order(id:"DESC").page(params[:page]).per(30)
    @word = Word.new(content: '前の語のしっぽ')
    @new_word = Word.last
  end

  def show
    @word = Word.find(params[:id])
    @yourei = @word.youreis.build
    @youreis = @word.youreis.order(id:"DESC").page(params[:page]).per(20)
  end

  def new
  end

  def create
    @word = current_user.words.build(word_params)

    if @word.save
      flash[:success] = '尻取り、続きます！'
      redirect_to words_path
    else
      flash[:danger] = 'もう一度、尻取り'
      redirect_to words_path
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])

    if @word.update(word_params)
      flash[:success] = '新たに、尻取り'
      redirect_to @word
    else
      flash.now[:danger] = '尻取り、もう一度！'
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    flash[:success] = 'いまの尻取りやめた'
    redirect_to words_url
   end

  private

  # Strong Parameter
  def word_params
    params.require(:word).permit(:content)
  end

end
