class WelcomeController < ApplicationController
  def index
    @user = current_user
  end

  def overview; end
end
