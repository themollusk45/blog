class UpdateUsersWithBlogOptions < ActiveRecord::Migration
  def up
  	add_column :users, :col_color, :string
  	add_column :users, :bg_image, :integer
  	add_column :users, :bg_color, :string
  	add_column :users, :font_color, :string
  	add_column :users, :font, :string
  	add_column :users, :font_size, :integer
  	add_column :users, :link_color, :string
  	add_column :users, :title_size, :integer
  	add_column :users, :title_color, :string
  	add_column :users, :keywords, :text

  end

  def down
  	remove_column :users, :col_color
  	remove_column :users, :bg_image
  	remove_column :users, :bg_color
  	remove_column :users, :font_color
  	remove_column :users, :font
  	remove_column :users, :font_size
  	remove_column :users, :link_color
  	remove_column :users, :title_size
  	remove_column :users, :title_color
  	remove_column :users, :keywords
  end
end
