# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy]

  def add_work_experience
    path = Rails.application.routes.recognize_path(request.referer)

    @profile = Profile.new(profile_params)
    @profile.work_experiences.build
    render path[:action] || :new
  end

  # GET /profiles
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  def show
    @user = @profile.user
  end

  def show_mine
    @user = current_user
    @profile = @user.profile
    if @profile.nil?
      redirect_to new_profile_url
    else
      render :show
    end
  end

  # GET /profiles/new
  def new
    @profile = current_user.build_profile
    @profile.work_experiences.build
  end

  # GET /profiles/1/edit
  def edit; end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /profiles/1
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params
        .require(:profile)
        .permit(:message, :github_id, :facebook_id, :twitter_id,
                work_experiences_attributes: %i[id company_name work_start_on work_end_on _destroy])
    end
end
