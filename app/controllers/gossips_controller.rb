class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @user = current_user
    @gossips_all = Gossip.all.sort_by{|g| -g.id}
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @user = current_user
    @gossip = Gossip.find(params[:id])
    @author = @gossip.author
    @comments = Comment.where(commented_gossip_id: @gossip.id) 
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur

    # TODO  post_params
    @gossip = Gossip.new(
      author: current_user, 
      title: params['title'], 
      content: params['content'])

    if @gossip.save
      flash[:success] = "Potin bien créé !"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    redirect_to root_path if @gossip.author != current_user
  end

  def update
    # Méthode qui met à jour le potin
    @gossip = Gossip.find(params[:id])
    
    if @gossip.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    @comments = Comment.where(commented_gossip_id:  @gossip.id)
    @comments.each {|c| c.destroy}
    redirect_to root_path, notice: 'Supprimé !'
  end

  

  private
  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end

end