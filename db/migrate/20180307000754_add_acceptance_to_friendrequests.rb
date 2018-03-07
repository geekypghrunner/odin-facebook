class AddAcceptanceToFriendrequests < ActiveRecord::Migration[5.1]
  def change
    add_column :friend_requests, :accept, :boolean
  end
end
