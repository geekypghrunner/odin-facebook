class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :accept_friend_id
      t.integer :sent_friend_id

      t.timestamps
    end
  end
end
