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
		#need to
		project = Project.where(:id => params[:projectid].to_i).first
		@projectpicture.project = project
		respond_to do |format|
			if project.profiles.include?(current_user)
				if @projectpicture.save
    		  		format.html { redirect_to project_path(@projectpicture.project.id)+"/managepictures", notice: 'Project was successfully destroyed.' }
    			else
      				format.js {render status: :internal_server_error}
				end
			else
    			format.html { redirect_to project_path(@projectpicture.project.id), notice: 'Must be a creator to edit pictures' }
			end
		end
	end

	def update
		@projectpicture = Projectpicture.where(:id => params[:id].to_i).first
		respond_to do |format|
			if @projectpicture.project.profiles.include?(current_user)
    			if @projectpicture.update_attributes(projectpicture_params)
    			  	format.html { redirect_to project_path(@projectpicture.project.id)+"/managepictures", notice: 'Project was successfully updated.' }
    			else
    			  	format.html { redirect_to project_path(@projectpicture.project.id)+"/managepictures", notice: 'Update failed.' }
    			end
			else
    			format.html { redirect_to project_path(@projectpicture.project.id), notice: 'Must be a creator to edit pictures' }
			end
    	end
	end

	def destroy
		#have to figure this out
		@projectpicture = Projectpicture.where(:id => params[:id].to_i).first
    	respond_to do |format|
    		if @projectpicture.project.profiles.include?(current_user)
    			@projectpicture.destroy
    		  	format.html { redirect_to project_path(@projectpicture.project.id)+"/managepictures", notice: 'Project was successfully destroyed.' }
    		  	format.json { head :no_content }
			else
    			format.html { redirect_to project_path(@projectpicture.project.id), notice: 'Must be a creator to edit pictures' }
			end
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
