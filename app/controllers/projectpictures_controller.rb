class ProjectpicturesController < ApplicationController

	def new
		@projectpicture = Projectpicture.new
	end

	def create
		@projectpicture = Projectpicture.new(projectpicture_params)
		project = Project.where(:id => session[:project]).first
		@projectpicture.project = project
		respond_to do |format|
			if @projectpicture.save
				#format.html {render partial: "projects/thumbnailbar", object: project, as: "project"}
      			format.js { render :js => "alert('hello there')"}
    		else
      			format.js {render status: :internal_server_error}
			end
			#session.delete(:project)
		end
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
