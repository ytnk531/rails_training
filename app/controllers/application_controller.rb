# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_sign_in!, raise: false

  private

  def current
    current_user
  end

  def require_sign_in!
    redirect_to login_path unless logged_in?
  end
end
