class SimplePagesController < ApplicationController
  def index
  	@users = User.all
  	@projects = Project.all
  end

  def about
  end

  def contact
  end

  def the_projects
  	@projects = Project.all
  end
end
