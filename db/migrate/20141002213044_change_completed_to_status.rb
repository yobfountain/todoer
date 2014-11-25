class ChangeCompletedToStatus < ActiveRecord::Migration
  def change
  	remove_column :tasks, :completed
  	remove_column :tasklings, :completed
  	add_column :tasks, :status, :integer
  	add_column :tasklings, :status, :integer
  end
end
