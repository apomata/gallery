class ProjectpicturesController < ApplicationController
	belongs_to :project
	protect_from_forgery


	def new
		@projectpicture = Projectpicture.new
	end

	def create
		binding.pry
		@projectpicture = Projectpicture.new(projectpicture_params)
		@projectpicture.project = session[:project]
		#respond_to do |format|
			if @projectpicture.save
				#format.html { redirect_to @project, notice: 'Project was successfully created.' }
				format.html { redirect_to project_path(session[:project]), notice: 'Project was successfully created.' }
				#format.json { render :show, status: :created, location: @project }
			else
				#format.html { render :new }
				#format.json { render json: @project.errors, status: :unprocessable_entity }
			end
		#end
		session.delete(:project)
	end

	def update
		binding.pry
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @projectpicture = Projectpicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projectpicture_params
      params.require(:projectpicture).permit(:picture, :description)
    end

end
