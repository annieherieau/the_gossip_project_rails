class ApplicationController < ActionController::Base
  def loged_user
    @loged_user = User.find(7)
  end

end
