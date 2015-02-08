class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :uid
      t.string :name
      t.string :screen_name
      t.string :location
      t.string :description
      t.integer :followers_count, default: 0
      t.integer :friends_count, default: 0
      t.integer :listed_count, default: 0
      t.integer :favorites_count, default: 0
      t.string :lang
      t.integer :statuses_count, default: 0
      t.boolean :following_now
      t.boolean :followed_before
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :profiles, :uid
    add_index :profiles, :user_id
    add_index :profiles, [:uid, :user_id], unique: true
  end
end
