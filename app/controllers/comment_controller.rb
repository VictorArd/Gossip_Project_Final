class CommentController < ApplicationController
  def new
    p '*' * 60
    p params
    p '*' * 60
    @comment = Comment.new()
    @gossip = params[:format]
  end

  def create
    p '*' * 60
    p params
    p '*' * 60
    @comment = Comment.new(content: params[:comment], gossip_id: params[:gossip_id], user: User.find_by(first_name: 'Anonymous'))

      if @comment.save
        flash[:success] = "Votre commentaire a été créé!"
        redirect_to gossip_path(@gossip_id)
      else
        flash[:danger] = "Une erreur est survenue, veuillez réessayer"
        render :new
    end
  end


  def edit
    p '*' * 60
    p params
    p '*' * 60
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    post_params = params.require(:comment).permit(:content)

    if @comment.update(post_params)
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
end
