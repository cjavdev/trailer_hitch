class FollowBot
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def followers_of(twitter_user)
    twitter_client.followers(twitter_user)
  end

  def twitter_client
    user.twitter_client
  end
end
