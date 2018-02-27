class CreateTodoLists < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_lists do |t|
      t.references :project, foreign_key: true
      t.text :description
      t.date :scheduled_to

      t.timestamps
    end
  end
end
