class SwitchToBiggerIds < ActiveRecord::Migration
  def change
    change_column :profiles, :follower_id, :bigint
    change_column :profiles, :followee_id, :bigint
  end
end
