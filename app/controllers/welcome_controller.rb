class WelcomeController < ApplicationController
  def index
    @my_name = params[:name]
    @course = "Rails"
  end
end
