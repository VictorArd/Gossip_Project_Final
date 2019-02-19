class CommentController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create, :edit, :update, :destroy]

  def show
  	@gossip = Gossip.find(params[:gossip_id])
  	@comment = Comment.find(params[:id])
  end

  def new
    p '*' * 60
    p params
    p '*' * 60
    @comment = Comment.new()
    @gossip = Gossip.find(params[:gossip_id])
  end

  def create
    p '*' * 60
    p params
    p '*' * 60
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:comment], gossip: @gossip, user_id: current_user.id)
      if @comment.save
        flash[:success] = "Votre commentaire a été créé!"
        redirect_to gossip_path(params[:gossip_id])
      else
        flash[:danger] = "Une erreur est survenue, veuillez réessayer"
        render :new
    end
  end


  def edit
    p '*' * 60
    p params
    p '*' * 60
    @gossip = Gossip.find(params[:gossip_id])
  	@comment = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
  	@comment = Comment.find(params[:id])

    if @comment.update('content' => params[:content], 'user' => @comment.user, 'gossip' => @comment.gossip)
      flash[:success] = "Votre commentaire a été modifié!"
      redirect_to gossip_path(@comment.gossip.id)
    else
      flash[:danger] = "Une erreur est survenue, veuillez réessayer"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      flash[:success] = "Votre commentaire a été supprimé avec succès!"
      redirect_to gossip_path(@comment.gossip.id)
    else
      flash[:danger] = "Une erreur est survenue, veuillez réessayer"
      render gossip_path(@comment.gossip.id)
    end
  end

  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Connectez-vous pour accéder à la page des commentaires"
        redirect_to new_session_path
      end
    end
end
