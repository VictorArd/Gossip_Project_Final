class GossipController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    p '*' * 60
    p params
    p '*' * 60
    @gossip = Gossip.new()
  end

  def create
    p '*' * 60
    p params
    p '*' * 60
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(first_name: 'Anonymous'))

      if @gossip.save
        flash[:success] = "Votre potin a été créé!"
        redirect_to :root
      else
        flash[:danger] = "Une erreur est survenue, veuillez réessayer"
        render :new
    end
  end
end
