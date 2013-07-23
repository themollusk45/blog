class AddBioAndSummaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :summary, :text
  end
end
