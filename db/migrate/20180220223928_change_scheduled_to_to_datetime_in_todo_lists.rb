class ChangeScheduledToToDatetimeInTodoLists < ActiveRecord::Migration[5.1]
  def change
    change_column :todo_lists, :scheduled_to, :datetime
  end
end
