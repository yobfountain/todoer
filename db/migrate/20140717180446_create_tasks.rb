class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :user
      t.boolean :completed
      t.timestamps
    end
  end
end
