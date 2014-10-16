class AddTwitterFollowersToUser < ActiveRecord::Migration
  def change
  	add_column :users, :followers_twitter, :integer
  end
end
