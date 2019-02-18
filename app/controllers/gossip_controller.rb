class GossipController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.all.where(gossip_id: params[:id])
    @tags = Tag.all
  end

  def new
    p '*' * 60
    p params
    p '*' * 60
    @gossip = Gossip.new()
    @tags = Tag.all
  end

  def create
    p '*' * 60
    p params
    p '*' * 60
    @tags = Tag.all
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(first_name: 'Anonymous'))

      if @gossip.save
        flash[:success] = "Votre potin a été créé!"
        redirect_to :root
      else
        flash[:danger] = "Une erreur est survenue, veuillez réessayer"
        render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    post_params = params.require(:gossip).permit(:title, :content)

    if @gossip.update(post_params)
      flash[:success] = "Votre potin a été modifié!"
      redirect_to gossip_path(@gossip.id)
    else
      flash[:danger] = "Une erreur est survenue, veuillez réessayer"
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])

    if @gossip.destroy
      flash[:success] = "Votre potin a été supprimé avec succès!"
      redirect_to :root
    else
      flash[:danger] = "Une erreur est survenue, veuillez réessayer"
      render gossip_path
    end
  end

end
