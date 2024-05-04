class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string 'first_name'
      t.string 'last_name', null: true
      t.string 'email', null: false
      t.string 'username', null: false

      t.timestamps
    end
  end
end
