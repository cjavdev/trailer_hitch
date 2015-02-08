class AddUnfollowedAtToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :unfollowed_at, :date
  end
end
