class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params['email'])
    puts session[:user_id]
    puts @user.email
    puts @user.password==params['input_pwd']
    puts params['input']
    puts  @user.authenticate(params['input_pwd'])
    puts session[:user_id]
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    # if @user && @user.authenticate(params['input_password'])
    if @user && @user.authenticate(params['input_pwd'])
      session[:user_id] = @user.id
      # redirige où tu veux, avec un flash ou pas
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      puts 'Invalid email/password combination'
      render new_session_path
    end
  end

  def destroy
    @user = User.find(params['id'])
    session.delete(:user_id)
    # redirect_to session_path, status: :see_other
  end
end
