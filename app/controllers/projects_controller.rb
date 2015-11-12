class ProjectsController < ApplicationController
  include ProjectsHelper
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show, :vote]
  acts_as_token_authentication_handler_for User, except: [:index, :show]
  protect_from_forgery with: :null_session


  # GET /projects
  # GET /projects.json
  def index
    if params[:archived]
      @projects = Project.archived.order_by([[ :sequence, :desc ]]).paginate(:page => params[:page], :per_page => params[:per_page])
    elsif params[:active]
      @projects = Project.active.order_by([[ :sequence, :desc ]]).paginate(:page => params[:page], :per_page => params[:per_page])
    else
      @projects = Project.order_by([[ :sequence, :desc ]]).paginate(:page => params[:page], :per_page => params[:per_page])
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @project.inc(views: 1)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def sort
    respond_to do |format|
      params[:ids].each_with_index do |id, index|
        doc = Project.find(id)
        doc.update_attribute(:sequence, index) if doc
      end
      format.json { render json: nil, status: :ok }
    end
  end

  def vote
    respond_to do |format|
      @project = Project.find(params[:id])
      votes = @project.votes + 1
      if @project.update(:votes => votes)
        format.json { render json: votes, status: :ok }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      if params[:id] != 'sort'
        @project = Project.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :id, :date, :sequence, :votes, :projectUrl, :isActive, :slug, :description, :shortDescription, :tags, :skills, :thumbnail, :banner, :screenshots, :size, :archived)
    end
end
