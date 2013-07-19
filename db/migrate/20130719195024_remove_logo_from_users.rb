class RemoveLogoFromUsers < ActiveRecord::Migration
  def up
	drop_attached_file :users, :logo
  end

  def down
    change_table :users do |t|
      t.attachment :logo
    end
  end
end
