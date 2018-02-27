class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :authenticate_with_token!
  before_action :set_project, only: :todo_lists

  def index
    render json: current_user.projects.to_json(methods: [:count_todo_lists, :todo_lists_evaluation]), status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      begin
        @project = current_user.projects.find(params[:id])
      rescue => exception
        head 401
      end
    end
end
