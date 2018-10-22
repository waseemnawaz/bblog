class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /projects
  # GET /projects.json
  def index
    @user = User.find(params[:user_id])
    @projects = @user.projects
    #@projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:id])
  end

  # GET /projects/new
  def new
    #@project = Project.new
    user = User.find(params[:user_id])
    @project = user.projects.build
  end

  # GET /projects/1/edit
  def edit
    user = User.find(params[:user_id])
    @project = user.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    #@project = Project.new(project_params)
    user = User.find(params[:user_id])
    @project = user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to([@project.user, @project], notice: 'Project was successfully created.') }
        format.json { render :show, status: :created, location: [@project.user, @project] }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update

    user = User.find(params[:user_id])
    @project = user.projects.find(params[:id])

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to([@project.user, @project], notice: 'Project was successfully updated.') }
        format.json { render :show, status: :ok, location: [@project.user, @project] }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    user = User.find(params[:user_id])
    @project = user.projects.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :content, :image_url, :user_id, :category_id)
    end
end
