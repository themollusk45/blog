class AddOpacityToUseroptions < ActiveRecord::Migration
  def change
  	change_column :users, "title_color", :string, default: 'ffffff'
  	add_column :users, :column_opacity, :string, default: '0.5'
  	
  end
end
