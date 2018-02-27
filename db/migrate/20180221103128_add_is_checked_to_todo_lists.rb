class AddIsCheckedToTodoLists < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_lists, :is_checked, :boolean
  end
end
