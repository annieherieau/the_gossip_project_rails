class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]

  def welcome
    @user = current_user if logged_in?
  end

  def show
    @user = User.find(params['id'])
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
      email_confirmation: params['email_confirmation'],
      password: params['password'],
      input_pwd: params['password'],
      password_confirmation: params['password_confirmation'],
      age: params['age'].to_s,
      description: params['description'],
      is_admin: false
    )
    @user.city_id = params['city_id'].to_i unless params['city_id'].to_i.zero?
    # @_errors = []
    # confirmation du mot de passe?
    #flash.now[:danger] = 'Invalid email/password combination'
    # @user.password = params[:password]
    # @_errors.push(is_password_valid?) unless is_password_valid?
    # @_errors.push(is_password_confirmed?) unless is_password_confirmed?

    if @user.save
      log_in(@user)
      remember(@user) unless params['remember_check'].to_i.zero?
      redirect_to root_path
    else
      render :new
    end
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
