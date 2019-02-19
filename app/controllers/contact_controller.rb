class ContactController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
  end

  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Connectez-vous pour accéder à la page de contact"
        redirect_to new_session_path
      end
    end
end
