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

FactoryGirl.define do
  factory :profile do
    uid "MyString"
name "MyString"
screen_name "MyString"
location "MyString"
description "MyString"
followers_count 1
friends_count 1
listed_count 1
favorites_count 1
lang "MyString"
statuses_count 1
following_now false
followed_before false
  end

end
