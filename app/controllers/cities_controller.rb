class CitiesController < ApplicationController
  def index
    @cities_all = Gossip.all
  end

  def show
    @city = City.find(params[:id])
    @users = User.where(city: @city)
    @gossips_all = Gossip.joins(:author).where(users: { id: @users.pluck(:id) })
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
