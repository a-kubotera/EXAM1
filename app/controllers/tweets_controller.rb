class TweetsController < ApplicationController
  before_action:set_tw,only:[:edit,:update,:destroy]
  before_action:submitBtnName,only:[:edit,:new,:confirm,:update]
  def index
    @tweets = Tweet.all
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tw_param)
    else
      @tweet = Tweet.new
    end
  end
  
  def create
    @tweet = Tweet.new(tw_param)
    if @tweet.save
      redirect_to tweets_path, notice: "つぶやきました！"   
    else 
      render 'new'
    end
  end
  
  def confirm
    @tweet = Tweet.new(tw_param)
    if @tweet.invalid?
      @sbmitbtn = '確認画面へ'
      render :new 
    end 
  end
  
  def edit
  end
  
  def update
    @tweet.update(tw_param)
    if @tweet.update(tw_param)
      redirect_to tweets_path, notice: "ツイートを更新しました！！"  
    else
       render 'edit'
    end
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました！"   
  end
  
    private
    def tw_param
      params.require(:tweet).permit(:content)
    end
    def set_tw
      @tweet = Tweet.find(params[:id])
    end
    def submitBtnName
      case self.action_name
        when /new|confirm/
          @formtitle = "新規ツイート"
          @sbmitbtn = "確認画面へ"
          @classAdd = "btn-primary"
        when /edit|update/
          @formtitle = "ツイート編集"
          @sbmitbtn = "更新する"
          @classAdd = "btn-danger"
      else
        puts 'エラー'
      end
    end
end
