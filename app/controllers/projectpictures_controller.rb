class ProjectpicturesController < ApplicationController

	def managepics
		project = Project.where(:id => params[:id].to_i).first
		@projectpictures = project.projectpictures
	end

	def new
		@projectpicture = Projectpicture.new
	end

	def create
		@projectpicture = Projectpicture.new(projectpicture_params)
		project = Project.where(:id => session[:project]).first
		@projectpicture.project = project
		respond_to do |format|
			if @projectpicture.save
				format.html {render partial: "projects/thumbnailbar", object: project, as: "project"}
    		else
      			format.js {render status: :internal_server_error}
			end
			#session.delete(:project)
		end
	end

	def update
    	#if @projectpicture.update_attributes(projectpicture_params)
    	#   redirect_to project_path(@projectpicture.project.id)+"/managepictures", notice: 'picture was successfully updated.' }
    	#else
    	#  redirect_to project_path(@projectpicture.project.id)+"/managepictures", notice: 'Updating picture failed.' }
    	#end
	end

	def destroy
		#have to figure this out
		binding.pry
		@projectpicture = Projectpicture.where(:id => params[:id].to_i).first
    	@projectpicture.destroy
    	respond_to do |format|
    	  format.html { redirect_to project_path(@projectpicture.project.id)+"/managepictures", notice: 'Project was successfully destroyed.' }
    	  format.json { head :no_content }
    	end
    	#need to destroy all userprojects associated with this.
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
