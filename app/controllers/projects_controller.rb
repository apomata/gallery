class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

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

  respond_to :html, :json
  def addpicture
      if logged_in?
            # think this should save the user I think
            @projectpicture = Projectpicture.create!(projectpicture_params)
            @projectpicture.project = @project
            format.html { redirect_to @project}
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


  #if I want to add restrict the more projects and putt more button
  #need to figure out the html with is the bad
  @count = 0;
  pcount = 0
  profilesprojects = Array.new(@project.profiles.length) { @project.profiles[pcount].projectpictures; pcount+=1}
  def nextfourprojects

    nextprojects
    for (var i = 0; i < 4; i++)
      project = profiles[@count % @project.profiles.length].shift
      projecthtml = "shit"
      nextprojects <<project
      @count += 1
    end
    return nextprojects
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :image_url, :embedcode)
      #not sure if I want to allow scripts the potential for disaster is huge but gist uses it

    end

    def projectpicture_params
      params.require(:projectpicture).permit(:picture, :description)
    end
end
