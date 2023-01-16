class WelcomeController < ApplicationController
  def index
     cookies[:curso] = "curso de ruby on rails (cookies)"
     session[:curso] = "curso de ruby on rails (session)"

    @my_name = params[:name]
    @course = "Rails"
  end
end