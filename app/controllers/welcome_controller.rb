class WelcomeController < ApplicationController
  before_action :authenticate_user, only: [:show]
  def show
    p "*" * 60
    p params
    p "*" * 60
  end

  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Connectez-vous pour accéder à la page d'accueil personnalisée"
        redirect_to new_session_path
      end
    end
end
