class UserController < ApplicationController
  before_action :authenticate_user, only: [:show]
  def show
    @user = User.find(params[:id])
  end

  def new
    p params
    @user = User.new()
    @cities = City.all
  end

  def create
    p '*' * 20
    p params
    p '*' * 20
    @cities = City.all


    @user = User.new( first_name: params[:first_name],
                      last_name: params[:last_name],
                      email: params[:email],
                      description: params[:description],
                      age: params[:age],
                      city_id: params[:city],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation]
                    )

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Votre compte a été créé avec succès!"
      redirect_to :root
    else
      flash[:danger] = "Une erreur est survenue, veuillez réessayer"
      render :new
    end
  end

  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Connectez-vous pour accéder à la page de l'utilisateur"
        redirect_to new_session_path
      end
    end
end
