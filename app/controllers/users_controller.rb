class UsersController < ApplicationController
  before_filter :load_resource
  authorize_resource
  
  def index
    @users = User.order("name").page(params[:page]) 
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end
  
  def create
    @user = User.new(params[:user])
    if User.count < 1
      @user.role = :administrator.to_s
    end
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      session[:user_id] = @user.id    
      redirect_to root_url, :notice => "Successfully created user."
    else
      render 'new'
    end
  end
  
  def update
    if @user.update_attributes(params[:user])      
      redirect_to @user, :notice => "Successfully updated user."
    else
      render 'edit'
    end
  end

  def destroy
    if @user = current_user
      session[:user_id] = nil
    end
    @user.destroy
    redirect_to users_path, :notice => "Successfully destroyed user."
  end
  
private

  def load_resource
    @user = User.find_by_url(params[:id])
  end
end