class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :secret
      t.string :token
      t.string :uid
      t.string :name
      t.string :image
      t.string :session_token
      t.string :nickname

      t.timestamps null: false
    end

    add_index :users, :uid, unique: true
  end
end
