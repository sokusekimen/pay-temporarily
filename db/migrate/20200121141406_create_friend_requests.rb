class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps
    end
  end
end
