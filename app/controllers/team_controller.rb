class TeamController < ApplicationController
  before_action :authenticate_user, only: [:show]
  def show
  end

  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Connectez-vous pour accéder à la page de la team"
        redirect_to new_session_path
      end
    end
end
