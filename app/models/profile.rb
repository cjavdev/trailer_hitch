# == Schema Information
#
# Table name: profiles
#
#  id               :integer          not null, primary key
#  uid              :string
#  name             :string
#  screen_name      :string
#  location         :string
#  description      :string
#  followers_count  :integer          default("0")
#  friends_count    :integer          default("0")
#  listed_count     :integer          default("0")
#  favorites_count  :integer          default("0")
#  lang             :string
#  statuses_count   :integer          default("0")
#  following_now    :boolean
#  followed_before  :boolean
#  follower_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  followee_id      :integer
#  unfollowed_at    :date
#  following_me_now :boolean          default("true")
#  followed_at      :date
#  unfollowed_me_at :date
#  followed_me_at   :date
#

class Profile < ActiveRecord::Base
  belongs_to :follower, class_name: "User", foreign_key: :follower_id
  belongs_to :followee, class_name: "User", foreign_key: :followee_id

  def unfollow!
    follower.twitter_client.unfollow(uid.to_i)
    self.unfollowed_at = Date.current
    self.following_now = false
    self.save!
  end
end
