class UsersController < ApplicationController

  # def index
  # end

  # def edit
  # end

  # def sign_up_params
  #   params.permit(:nickname, :email, :password, :surname, :name, :usrname_kana, :name_kana, :birthday)
  # end

  # def account_update_params
  #   params.permit(:name, :email)
  # end

   def update
     if current_user.update(user_params)
       redirect_to root_path
     else
       render :edit
     end
   end

   private

   def user_params
     params.require(:user).permit(:password, :email)
   end

end
