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

require 'rails_helper'

RSpec.describe Profile, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
