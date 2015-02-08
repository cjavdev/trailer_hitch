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

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
