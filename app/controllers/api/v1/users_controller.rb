class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_with_token!

  def index
    render json: current_user, status: 200
  end
end
