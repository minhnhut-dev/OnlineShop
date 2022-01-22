class Api::UsersController < ApplicationController
  def edit_user
    @user = User.find(params[:id])
      if @user.update(user_params)
          render json: {
            message: 'User updated',
            data: @user
          }
        else
          render json: {
              message: 'Not updated',
              data: @user
            }
      end
  end
  protected

  def user_params
    params.permit(:email, :name, :address, :phone)
  end
end
