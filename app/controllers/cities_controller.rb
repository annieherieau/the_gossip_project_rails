class CitiesController < ApplicationController
  before_action :authenticate_user
  def index
    @cities_all = Gossip.all
  end

  def show
    @city = City.find(params[:id])
    @users = User.where(city: @city)
    @gossips_all = Gossip.joins(:author).where(users: { id: @users.pluck(:id) })
  end
end
