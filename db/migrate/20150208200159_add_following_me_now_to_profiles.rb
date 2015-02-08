class AddFollowingMeNowToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :following_me_now, :boolean, default: true
    add_column :profiles, :followed_at, :date
    add_column :profiles, :unfollowed_me_at, :date
    add_column :profiles, :followed_me_at, :date
  end
end
