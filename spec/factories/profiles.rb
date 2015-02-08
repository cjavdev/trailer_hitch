# == Schema Information
#
# Table name: profiles
#
#  id              :integer          not null, primary key
#  uid             :string
#  name            :string
#  screen_name     :string
#  location        :string
#  description     :string
#  followers_count :integer          default("0")
#  friends_count   :integer          default("0")
#  listed_count    :integer          default("0")
#  favorites_count :integer          default("0")
#  lang            :string
#  statuses_count  :integer          default("0")
#  following_now   :boolean
#  followed_before :boolean
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
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
