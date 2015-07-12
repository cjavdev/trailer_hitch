class InFollow
  attr_reader :user, :in_friend_id

  def initialize(user, in_friend_id)
    @user = user
    @in_friend_id = in_friend_id
  end

  def call
    if create_in_follow
      thank_for_following
      self.delay(run_at: 1.minutes.from_now).ask_question
    end
  end

  def thank_for_following
    # twitter_client.dm(twitter_client.user(in_friend_id), thank_you_message)
  end

  def ask_question
    # twitter_client.dm(twitter_client.user(in_friend_id), question_message)
  end

  def thank_you_message
    # TODO: make this relevant to them
    feelings = ["super stoked", "excited", "pumped", "thrilled", "amped"]
    intros = ["Thanks for following!", "Thx for the follow!", "Hey!", "Whats up!?"]
    "#{ intros.sample } Im #{feelings.sample} for you to find new stocks to trade. Let me know what you think! https://goo.gl/UdxzMB"
  end

  def question_message
    things = ["insider trading", "sec filings", "SEC form4s"]
    "Have you ever tried using #{things.sample} as a buy signal? Thats what I'm all about and I've been beating SP500 for a while :)"
  end

  def create_in_follow
    unless in_friend_id.is_a?(Integer)
      raise "Invalid Friend Id: #{ in_friend_id }"
    end

    user = twitter_client.user(in_friend_id)
    Profile.create({
      followee_id: user.id,
      followed_me_at: Date.current,
      uid: user.id.to_s,
      name: user.name,
      screen_name: user.screen_name,
      location: user.location,
      description: user.description,
      lang: user.lang,
      following_me_now: true,
      followers_count: user.followers_count,
      friends_count: user.friends_count,
      favorites_count: user.favourites_count,
      listed_count: user.listed_count,
      statuses_count: user.statuses_count
    })
  end

  def twitter_client
    user.twitter_client
  end
end
