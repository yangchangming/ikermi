class RegisterController < ApplicationController

  layout "application"

  def index
    @user = User.new
  end

end
