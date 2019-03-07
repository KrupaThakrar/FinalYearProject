class UsersController < ApplicationController
  before_filter :authorize_admin, except: [:show]

def edit
  @user = User.find(params[:id])
end

def index
  @users = User.all
end

def create
 @user = User.new(params[user_params])
 if @user.save
  redirect_to @user, :flash => { :success => 'User was successfully created.'}
 else 
  render @action => 'new'
 end 
end 

def new
  @user = User.new
end

def show
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to @user
  else
    render 'edit'

def destroy
  @user.destroy!

  respond_to do |format|
    format.json { respond_to_destroy(:ajax) }
    format.xml  { head :ok }
    format.html { respond_to_destroy(:html) }      
  end
end 

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to @user
  else 
    render 'edit'
  end 
end



