class UsersController < ApplicationController
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :age, :password)
  end
end
