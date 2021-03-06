class WordsController < ApplicationController
  before_action :test_user
  before_action :get_words
  before_action :search

  def search
   @search = Word.search(params[:q])
   if params[:q].nil? == false
    if params[:q][:content_eq] != ""
      @search_words = @search.result
    else
      @search_words = []
    end
   end
  end

  def index
#    @words = Word.all.order(id:"DESC").page(params[:page]).per(20)

    @new_word = Word.last

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
    @w = Word.where(content: @word.content)
    @youreis = []
    @w.each do |a|
      @youreis << a.youreis.order(id: "DESC").page(params[:page]).per(20)
    end
    @yourei = @word.youreis.build
    @page = @word.youreis.order(id: "DESC").page(params[:page]).per(20)
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

    session[:category] = params[:word][:category]

    if @word.save
      flash[:success] = '尻取り、続けよう！'
      redirect_to words_path
    else
      flash[:danger] = '尻取り、やり直し。'
      # redirect_to words_path
      redirect_to words_path
      # render :index #バリデーションエラー画面に飛ぶので、上記に。と思ったが、逆か。
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

  def get_words
     # @words = Word.all.order(id:"DESC").page(params[:page]).per(20)
     @q = current_user
       if params["commit"] == "自分の尻取りだけ"
        session[:flag] = 1
        @words = @q.words.order(id: "DESC").page(params[:page]).per(20)
      else
        # session[:flag] = 0
        @words = Word.all.order(id:"DESC").page(params[:page]).per(20)
      end

      if session[:flag] == 1
        @words = @q.words.order(id: "DESC").page(params[:page]).per(200)
      end

      if session[:flag] == 1 && params[:sort_flag].to_i == 1
        # binding.pry
        session[:flag] = 0
        @words = Word.all.order(id:"DESC").page(params[:page]).per(20)
      end
  end

  private

  # Strong Parameter 楽観的ロック追加
  def word_params
#    params.require(:word).permit(:content, :lock_version)
    params.require(:word).permit(:content, :category)
  end

end
