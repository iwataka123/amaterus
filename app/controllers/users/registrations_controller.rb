class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  before_action :log_in_check
  before_action :user_check

  private
  def user_check
    unless current_user.unique_user_id == "000001"
      redirect_to root_path
    end
  end
  def log_in_check
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end