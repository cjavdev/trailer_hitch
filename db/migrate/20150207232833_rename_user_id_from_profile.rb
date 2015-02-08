class RenameUserIdFromProfile < ActiveRecord::Migration
  def change
    rename_column :profiles, :user_id, :follower_id
    add_column :profiles, :followee_id, :integer
  end
end
