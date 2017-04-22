module TweetsHelper
  def allocation_method
    if action_name == 'new' || action_name == 'confirm'
      confirm_tweets_path
    elsif action_name == 'edit'
      tweet_path
    end
  end
end
