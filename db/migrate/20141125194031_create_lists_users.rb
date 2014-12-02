class CreateListsUsers < ActiveRecord::Migration
  def change
    create_join_table :lists, :users, table_name: :subscriptions
  end
end
