class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy,]
  helper_method :otherprojects

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
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

      if logged_in?
        respond_to do |format|
          if @project.save
            # think this should save the user I think
            @userproject = Userproject.create!(profile: current_user, project: @project)
            format.html { redirect_to @project, notice: 'Project was successfully created.' }
            format.json { render :show, status: :created, location: @project }
          else
            format.html { render :new }
            format.json { render json: @project.errors, status: :unprocessable_entity }
          end
        end
      else
        ActiveSupport::Notifications.instrument('render', extra: :information) do
        #render text: 'You must be signed in to create a project'
        render :new
        #format.html { render :new }
        #format.json { render json: @project.errors, status: :unprocessable_entity }
        end
         flash[:alert] = "You must be signed in to create a project"
      end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  #def update
  #  respond_to do |format|
  #    if @project.update(project_params)
  #      format.html { redirect_to @project, notice: 'Project was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @project }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @project.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  respond_to :html, :json
  def update

    if @project.update_attributes(project_params)
       flash[:alert] = "project successfully updated"
    else
       flash[:alert] = "project failed to update"
    end
    respond_with @project
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    binding.pry
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
    #need to destroy all userprojects associated with this.
  end

  def otherprojects
    otherprojects = Hash.new
    @project.profiles.each do |profile|
     profile.projects.each do |project|
        if (project != @project)
          otherprojects[project] = 1
        end
      end
    end
    return otherprojects
  end

  # POST /ajax/creatorremove
  def creatorremove

    result = params["p"].to_i
    project = Project.where(:id => params["p"].to_i).first
    if project.profiles.include?(current_user)
      #look up how to remove a has many relation
      respond_to do |format|
        if project.profiles.delete(current_user)
          format.json {render :json => {:result => "Creater successfully removed"}}
        else
        #  format.json { render json: project.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def picadd
    picture = params["picture"]
    description = params["description"]
    binding.pry
    Projectpicture.create(project: @project, picture: picture, description: description)

    respond_to do |format|
        if true
          format.json {render :json => {:result => "picture added"}}
        else
        #  format.json { render json: project.errors, status: :unprocessable_entity }
        end
      end

  end

  def createpic
    projectpicture = Projectpicture.new(projectpicture_params)
    @project = Project.where(:id => params["id"].to_i).first
    projectpicture.project = @project
    binding.pry
    #respond_to do |format|
      if projectpicture.save
        #format.html {render partial: "projects/thumbnailbar", object: @project, as: "project"}
        #format.js {render "alert(fuck);"}
        render partial: "projects/thumbnailbar", object: @project, as: "project"
        else
            #format.js {render status: :internal_server_error}
      end
      #session.delete(:project)
    #end
  end

   def preview
    # ... do something meaningful here ...
    #render :partial => 'preview', :content_type => 'text/html'
    @project = Project.where(:id => params["id"].to_i).first
    binding.pry
    render partial: "projects/thumbnailbar", object: @project, as: "project"
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def projectpicture_params
      binding.pry
      #params.require(:projectpicture).permit(:picture, :description)
      params.require(:project).permit(:picture, :description)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :image_url, :embedcode, :images)
      #not sure if I want to allow scripts the potential for disaster is huge but gist uses it

    end
end
