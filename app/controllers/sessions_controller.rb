# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_sign_in!, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email_address: params[:session][:email_address].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
