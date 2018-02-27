class Api::V1::TodoListsController < Api::V1::BaseController
  before_action :authenticate_with_token!
  before_action :set_todo_list, only: [:update]

  def index
    render json: current_user.todo_lists.where(project_id: params[:project_id]), status: 200
  end

  def update
    begin
      @todo_list.update(todo_list_params)
      render json: @todo_list, status: 200
    rescue => exception
      head 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      begin
        @todo_list = current_user.todo_lists.where(project_id: params[:project_id]).find(params[:id])
      rescue => exception
        head 401
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:is_checked)
    end
end
