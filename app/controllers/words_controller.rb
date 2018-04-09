class WordsController < ApplicationController
  before_action :test_user

  def index
    @words = Word.all.order(id:"DESC").page(params[:page]).per(20)
    @new_word = Word.last

#    @new_word_right = @new_word.content[-1]
#    @new_word_right2 = @new_word.content[-2]

    if
      @new_word.content[-1] =~ /[んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/ &&
      @new_word.content[-2] =~ /[んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/ &&
      @new_word.content[-3] =~ /[んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/ &&
      @new_word.content[-4] =~ /[^んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/
      @word = Word.new(content: @new_word.content[-4])
    elsif
      @new_word.content[-1] =~ /[んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/ &&
      @new_word.content[-2] =~ /[んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/ &&
      @new_word.content[-3] =~ /[^んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/ &&
      @word = Word.new(content: @new_word.content[-3])
    elsif
      @new_word.content[-1] =~ /[んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/ &&
      @new_word.content[-2] =~ /[^んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/ &&
      @word = Word.new(content: @new_word.content[-2])
    elsif
      @new_word.content[-1] =~ /[^んンゃゅょっャュョッぁぃぅぇぉァィゥェォー]/ &&
      @word = Word.new(content: @new_word.content[-1])
    else
      @word = Word.new(content: "ムズっ！")
    end
  end

  def show
    @word = Word.find(params[:id])

    @w = Word.find_by(content: @word.content)

#    @w = Word.where(content: @word.content)
#    @ow = @w.where.not(id: @word.id)

#    @w = Word.where(content: @word.content).where.not(id: @word.id)

    @yourei = @word.youreis.build

    @wy = @w.youreis.order(id:"DESC").page(params[:page]).per(20)

#    @owy = @ow.youreis.order(id:"DESC").page(params[:page]).per(20)

    @youreis = @word.youreis.order(id:"DESC").page(params[:page]).per(20)
  end

  def new
  end

  def create
    # #楽観的ロック
    # respond_to do |format|
    #   if @word.create_with_conflict_validation(word_params)
    #     format.html { redirect_to @word, notice: 'Word was successfully created.' }
    #   else
    #     format.html { render :create }
    #   end
    # end

    @word = current_user.words.build(word_params)

    if @word.save
      flash[:success] = '尻取り、続けよう！'
      redirect_to words_path
    else
      flash[:danger] = '尻取り、やり直し。'
      redirect_to words_path
    end

  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])

    if @word.update(word_params)
      flash[:success] = '尻取り、追加。'
      redirect_to @word
    else
      flash.now[:danger] = '尻取り、やり直し。'
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    flash[:success] = '尻取り、削除。'
    redirect_to words_url
   end

  private

  # Strong Parameter 楽観的ロック追加
  def word_params
#    params.require(:word).permit(:content, :lock_version)
    params.require(:word).permit(:content, :category)
  end

end
