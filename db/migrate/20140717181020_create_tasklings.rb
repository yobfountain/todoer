class CreateTasklings < ActiveRecord::Migration
  def change
    create_table :tasklings do |t|
      t.references :user, index: true
      t.references :task, index: true
      t.boolean :completed
      t.timestamps
    end
  end
end
