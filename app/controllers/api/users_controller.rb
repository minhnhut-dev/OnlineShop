class Api::UsersController < ApplicationController

  def edit_user
    @user= User.find(params[:id])
    if @user.email == params[:email]
      render json: { 
        message: ' Duplicate email, please choose another email'
      }
    else
      if @user.update(user_params)
          render json: {
            message: 'User updated',
            data: @user
          }
      end
    end
  end
  protected

  def user_params
    params.permit(:email, :name, :address)
  end
  
end
