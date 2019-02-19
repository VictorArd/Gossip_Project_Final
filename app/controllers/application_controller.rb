class ApplicationController < ActionController::Base
  include SessionHelper








  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Connectez-vous pour accéder à la création de potin"
        redirect_to new_session_path
      end
    end
end
