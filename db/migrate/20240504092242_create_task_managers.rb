class CreateTaskManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :task_managers do |t|
      t.string 'title', null: false
      t.text 'description'
      t.boolean 'is_completed', default: false
      t.references :users
      t.timestamps
    end
  end
end
