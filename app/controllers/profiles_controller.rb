class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  #helper_method :collaborators
  helper_method :course_user_count, :collaborators


  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  #def update
  #  respond_to do |format|
  #    #on update if new pic not input dont erase the old may need a delete function of a default
  #    if profile_params[:avatar].nil?
  #      profile_params[:avatar] = @profile.avatar
  #    end
  #    if @profile.update(profile_params)
  #      format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @profile }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @profile.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  respond_to :html, :json
  def update
    @profile.update_attributes(profile_params)
    respond_with @profile
  end


  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def collaborators
    collaborators = Hash.new
    @profile.projects.each do |project|
      project.profiles.each do |profile|
        if (profile != @profile)
          collaborators[profile] = 1
        end
      end
    end
    return collaborators
  end

  def course_user_count
    return 1
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :bio, :email, :image_url, :avatar)
    end
end
