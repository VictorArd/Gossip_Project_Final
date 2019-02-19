class SessionController < ApplicationController

  def new
  end

  def create
    p '*' * 60
    p params
    p '*' * 60
  	# cherche s'il existe un utilisateur en base avec l’e-mail
  	@user = User.find_by(email: params[:email])
  	# on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
  	if @user && @user.authenticate(params[:password])
    	session[:user_id] = @user.id
      flash[:info] = 'Vous êtes connecté avec succès'
    	redirect_to root_path
    	# redirige où tu veux, avec un flash ou pas
  	else
    	flash[:danger] = 'Email / Mot de passe invalide'
    	render 'new'
  	end
	end

  def destroy
  session.delete(:user_id)
  flash[:info] = 'Vous êtes déconnecté'
  redirect_to root_path
  end
end
