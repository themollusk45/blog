class ChangeDefaultValues < ActiveRecord::Migration
   def up
  	change_column :users, "col_color", :string, default:  'dddddd'
  	change_column :users, "bg_image", :integer, default:  "-999"
  	change_column :users, "bg_color", :string, default:  'ffffff'
  	change_column :users, "font_color", :string, default:  '000000'
  	change_column :users, "font", :string, default: '"Helvetica Neue", Helvetica, Arial, sans-serif'
  	change_column :users, "font_size", :string, default: "1.1em"
  	change_column :users, "link_color", :string, default: '0088cc'
  	change_column :users, "title_size", :string, default: "2em"
  	change_column :users, "title_color", :string, default: 'ffffff'
  end

  def down
  	raise ActiveRecord::IrreversibleMigration, "cant remove default"
  end
end
