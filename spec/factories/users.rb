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

FactoryGirl.define do
  factory :user do
    secret "MyString"
token "MyString"
uid "MyString"
name "MyString"
image "MyString"
session_token "MyString"
  end

end
