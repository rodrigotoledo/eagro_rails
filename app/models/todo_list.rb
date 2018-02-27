class TodoList < ApplicationRecord
  belongs_to :project
  validates :description, :project_id, presence: true
  validates_associated :project

  after_save :touch_project

  protected

  def touch_project
    self.project.touch
  end
end
