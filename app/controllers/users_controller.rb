class UsersController < ApplicationController
  def index
    @users = User.all
  end
#test   
  def show
    find_user_by_id
  end

  def new
    @user = User.new
  end

  def edit
    find_user_by_id
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    find_user_by_id

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit' 
    end
     
  end

  def destroy
    find_user_by_id
    @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
    
    def find_user_by_id
    	@user = User.find(params[:id])
    end
end
