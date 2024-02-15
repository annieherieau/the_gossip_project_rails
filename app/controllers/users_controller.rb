
class UsersController < ApplicationController
  def welcome
    @user = User.find(params[:id])
  end
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @city = @user.city
    @gossips = Gossip.where(author_id: @user.id)
    @comments = Comment.where(commenting_user_id: @user.id)
    @likes = Like.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    

    @user = User.new(
      first_name: params['first_name'],
      last_name: params['last_name'],
      email: params['email'],
      password: params['password'],
      age: params['age'].to_s,
      description: params['description'],
      is_admin: false
    )
    @user.city = params['city_id'].to_i unless params['city_id'].to_i.zero?
    # @_errors = []
    # confirmation du mot de passe?
    # @user.password = params[:password]
    # @_errors.push(is_password_valid?) unless is_password_valid?
    # @_errors.push(is_password_confirmed?) unless is_password_confirmed?

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def is_password_confirmed?
    params['password']==params['password_confirma'] ? 'Mots de passe non indentiques' : false
  end

  def is_password_valid?
    params['password'].length >=8 ? 'Mot de passe de 8 caractères minimum' : false
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def post_params
    post_params = params.require(:user).permit(:first_name, :last_name, :age, :email, :description, :password)
  end
end
