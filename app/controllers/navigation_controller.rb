class NavigationController < ApplicationController
  def index
    render({ :template => "navigation/homepage.html.erb" })
  end

end