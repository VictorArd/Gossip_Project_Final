class AccueilController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
    @gossips = Gossip.all
  end

  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Connectez-vous pour accéder à la page d'accueil"
        redirect_to new_session_path
      end
    end
end
