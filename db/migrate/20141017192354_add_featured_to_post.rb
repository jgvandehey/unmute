class AddFeaturedToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :feature, :boolean, null: false, default: false
  end
end
