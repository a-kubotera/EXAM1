class TweetsController < ApplicationController
  before_action:set_tw,only:[:edit,:update,:destroy]
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
    render :new if @tweet.invalid? #成功>>false 失敗:ture    
  end
  
  def edit
  end
  
  def update
    @tweet.update(tw_param)
    if @tweet.update(tw_param)
      redirect_to tweets_path, notice: "成功！"  
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
end
