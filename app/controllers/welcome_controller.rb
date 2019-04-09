class WelcomeController < ApplicationController

  def index
    if current_user.nil?
      redirect_to '/login'
    end
  end

  def show; end
end
