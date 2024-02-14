class GossipsController < ApplicationController
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips_all = Gossip.all.sort_by{|g| -g.id}
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find(params[:id])
    @comments = Comment.where(commented_gossip_id: @gossip.id) 
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    params['author_id'] = 1 if params['author_id'].to_i == 0

    @gossip = Gossip.new(
      author_id: params['author_id'].to_i, 
      title: params['title'], 
      content: params['content'])

    if @gossip.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end
  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @gossip = Gossip.find(params[:id])
    
    if @gossip.update(post_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end
  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossip = Gossip.find(params[:id])

  end
end