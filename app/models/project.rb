class Project < ApplicationRecord
  belongs_to :user
  has_many :todo_lists
  validates :title, presence: true

  attr_accessor :count_todo_lists, :todo_lists_evaluation

  def todo_lists_checkeds
    todo_lists.where('is_checked = ? ', true)
  end

  def todo_lists_not_checkeds
    todo_lists.where('(is_checked = ? OR is_checked IS NULL)', false)
  end

  def to_s
    title
  end

  def count_todo_lists
    self.todo_lists.count
  end

  def todo_lists_evaluation
    total_done = self.count_todo_lists
    total_in_progress = self.todo_lists.where(is_checked: true).count
    total = (total_done / total_in_progress.to_f).to_f
    if total == 1.0
      1.0
    elsif total_in_progress == 0
      0.25
    else
      total_in_progress/10.0
    end
  end
end
