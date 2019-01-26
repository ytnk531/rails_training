# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :require_sign_in!, only: %i[new create]
  before_action :require_admin!, only: %i[destroy]

  # GET /users
  def index
    @users = User.order(created_at: :desc)
  end

  # GET /users/1
  def show
    @profile = @user.profile
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in(@user)
        format.html { redirect_to new_profile_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :password, :email_address, :role, :password_confirmation)
  end

  def require_admin!
    redirect_to users_path unless current_user.role == "admin"
  end
end
