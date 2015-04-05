class AddCodeToLists < ActiveRecord::Migration
  def change
    add_column :lists, :code, :string
  end
end
