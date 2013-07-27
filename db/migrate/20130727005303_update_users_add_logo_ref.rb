class UpdateUsersAddLogoRef < ActiveRecord::Migration
  def up

  	add_column :users, :logo, :integer
  end

  def down
  	
    remove_column :users, :logo
  end
end
