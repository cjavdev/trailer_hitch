# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  secret        :string
#  token         :string
#  uid           :string
#  name          :string
#  image         :string
#  session_token :string
#  nickname      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  validates :uid, :name, presence: true
  has_many :out_profiles, class_name: 'Profile', foreign_key: :follower_id
  has_many :in_profiles, class_name: 'Profile', foreign_key: :followee_id

  before_validation do
    self.session_token ||= SecureRandom.hex
  end

  def self.find_with_omniauth(omniauth_hash)
    user = User.find_by(uid: omniauth_hash[:uid])
    return user if user
    User.create!({
      uid: omniauth_hash.fetch(:uid),
      secret: omniauth_hash.fetch(:credentials).fetch(:secret),
      token: omniauth_hash.fetch(:credentials).fetch(:token),
      name: omniauth_hash.fetch(:info).fetch(:name),
      nickname: omniauth_hash.fetch(:info).fetch(:nickname),
      image: omniauth_hash.fetch(:info).fetch(:image),
    })
  end

  def reset_session_token!
    self.session_token = SecureRandom.hex
    self.save
    session_token
  end

  def twitter_client
    @client ||= begin
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = token
        config.access_token_secret = secret
      end
    end
  end

  def twitter_friends
    @friends ||= twitter_client.friends
  end

  def twitter_followers
    @followers ||= twitter_client.followers
  end

  def twitter_friend_ids
    @twitter_friend_ids ||= twitter_client.friend_ids
  end

  def update_out_profiles2
    twitter_friend_ids.each do |friend_id|
      puts "Checking out #{ friend_id }"
      if !profile_exists_for?(friend_id)
        create_profile_for(friend_id)
      end
    end
  end

  def create_profile_for(friend_id)
    raise "Invalid Friend Id: #{ friend_id }" unless friend_id.is_a?(Integer)

    user = twitter_client.user(friend_id)
    Profile.create({
      follower_id: id,
      uid: user.id.to_s,
      name: user.name,
      screen_name: user.screen_name,
      location: user.location,
      description: user.description,
      lang: user.lang,
      following_now: true,
      followed_before: true,
      followers_count: user.followers_count,
      friends_count: user.friends_count,
      favorites_count: user.favourites_count,
      listed_count: user.listed_count,
      statuses_count: user.statuses_count
    })
  end

  def profile_exists_for?(profile_id)
    Profile.exists?(
      ['uid = ? AND (follower_id = ? OR followee_id = ?)', profile_id.to_s, id, id]
    )
  end

  def update_out_profiles
    twitter_friends.each do |follower|
      pro = Profile.where(
        'uid = ? AND (follower_id = ? OR followee_id = ?)', follower.id.to_s, id, id
      ).first

      if pro
        pro.update({
          follower_id: id,
          location: follower.location,
          followers_count: follower.followers_count,
          friends_count: follower.friends_count,
          favorites_count: follower.favourites_count,
          listed_count: follower.listed_count,
          statuses_count: follower.statuses_count
        })
      else
        Profile.create({
          follower_id: id,
          uid: follower.id.to_s,
          name: follower.name,
          screen_name: follower.screen_name,
          location: follower.location,
          description: follower.description,
          lang: follower.lang,
          following_now: true,
          followed_before: true,
          followers_count: follower.followers_count,
          friends_count: follower.friends_count,
          favorites_count: follower.favourites_count,
          listed_count: follower.listed_count,
          statuses_count: follower.statuses_count
        })
      end
    end
  end

  def update_in_profiles
    twitter_followers.each do |follower|
      pro = Profile.where(
        'uid = ? AND (follower_id = ? OR followee_id = ?)', follower.id.to_s, id, id
      ).first

      if pro
        pro.update({
          followee_id: id,
          location: follower.location,
          followers_count: follower.followers_count,
          friends_count: follower.friends_count,
          favorites_count: follower.favourites_count,
          listed_count: follower.listed_count,
          statuses_count: follower.statuses_count
        })
      else
        Profile.create({
          followee_id: id,
          uid: follower.id.to_s,
          name: follower.name,
          screen_name: follower.screen_name,
          location: follower.location,
          description: follower.description,
          lang: follower.lang,
          following_now: true,
          followed_before: true,
          followers_count: follower.followers_count,
          friends_count: follower.friends_count,
          favorites_count: follower.favourites_count,
          listed_count: follower.listed_count,
          statuses_count: follower.statuses_count
        })
      end
    end
  end
end
