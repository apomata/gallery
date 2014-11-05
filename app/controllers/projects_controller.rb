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

    if !newprojectpicture_params[:picture].nil? || !(newprojectpicture_params[:description] == "")
      @projectpicture = Projectpicture.new(newprojectpicture_params)
      @projectpicture.project = @project
    end

      if logged_in?
        respond_to do |format|
          if @project.save
            # think this should save the user I think
            @userproject = Userproject.create!(profile: current_user, project: @project)
            if @projectpicture
              if @projectpicture.save
                #not sure if need anything here
              else
                format.html { render :new }
                format.json { render json: @projectpicture.errors, status: :unprocessable_entity }
              end
            end
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

  def createpic
    binding.pry
    projectpicture = Projectpicture.new(projectpicture_params)
    @project = Project.where(:id => params["id"].to_i).first
    projectpicture.project = @project
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
    @project = Project.where(:id => params["id"].to_i).first
    projectpicture = Projectpicture.new(projectpicture_params)
    description = params["description"].values.first
    binding.pry
    if params["projectpicture"]
      picture = params["projectpicture"].values.first
      projectpicture = Projectpicture.new(description: description, picture: picture)
    else
      projectpicture = Projectpicture.new(description: description)
    end
    projectpicture.project = @project
    if projectpicture.save
      binding.pry
      render partial: "projects/thumbnailbar", object: @project, as: "project"
    else
        #may not work
      #binding.pry
      render status: :internal_server_error
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def projectpicture_params
      #params.require(:projectpicture).permit(:picture, :description)
      params.permit("picture", "description")
    end
    def newprojectpicture_params
      params.require(:projectpicture).permit(:picture, :description,)
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
