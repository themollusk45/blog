class CreateBlogOptions < ActiveRecord::Migration
  def change
    create_table :blog_options do |t|
      t.integer :bg_image
      t.string :column_color
      t.string :bg_color
      t.string :font_color
      t.string :font
      t.integer :font_size
      t.string :link_color
      t.integer :title_size
      t.string :title_color
      t.integer :user_id
      t.text :keywords

      t.timestamps
    end
  end
end
