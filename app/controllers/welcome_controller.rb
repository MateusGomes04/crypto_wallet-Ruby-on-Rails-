class WelcomeController < ApplicationController
  def index
     cookies[:curso] = "curso de ruby on rails"
     session[:curso] = "curso de ruby on rails"
     

    @my_name = params[:name]
    @course = "Rails"
  end
end