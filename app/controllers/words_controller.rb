class WordsController < ApplicationController
  def index
    @words = Word.all.order(id:"DESC").page(params[:page]).per(20)
    @new_word = Word.last

#    @new_word_right = @new_word.content[-1]
#    @new_word_right2 = @new_word.content[-2]

#    @word = Word.new

    if @new_word.content[-1] == "/[んン]/"#正規表現のorが効かない
      @word = Word.new(content: @new_word.content[-2])
    elsif @new_word.content[-1] == "/[ゃ−ょっ]/"#後ろから二番目が長音撥音だったら
      @word = Word.new(content: @new_word.content[-2])
    elsif @new_word.content[-1] == "/[ぁ−ぉー]/"#後ろから二番目が拗音撥音促音だったら
      @word = Word.new(content: @new_word.content[-2])
    else
      @word = Word.new(content: @new_word.content[-1])
    end
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
      flash[:success] = '尻取り、続けましょう！'
      redirect_to words_path
    else
      flash[:danger] = 'もう一度、尻取り考えて。'
      redirect_to words_path
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])

    if @word.update(word_params)
      flash[:success] = '尻取り、加わりました。'
      redirect_to @word
    else
      flash.now[:danger] = '尻取り、もう一度考えて！'
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    flash[:success] = '尻取り、削ります。'
    redirect_to words_url
   end

  private

  # Strong Parameter
  def word_params
    params.require(:word).permit(:content)
  end

end
