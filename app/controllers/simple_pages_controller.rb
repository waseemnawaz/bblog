class SimplePagesController < ApplicationController
  def index
  	@users = User.all
  	@projects = Project.all
  end

  def about
  end

  def contact
  end

  #without categories
  #def the_projects
  	#@projects = Project.all
  #end

  #with categories
  def the_projects
    if params.has_key?(:category)
      @category = Category.find_by_name(params[:category])
      @projects = Project.where(category: @category)
    else
      @projects = Project.all
    end
  end
end
