class ProfilesController < ApplicationController
  #before_filter :authorize_admin!, :except => [:index, :show]
  def new
    @profile = Profile.new
    @user = current_user
    @profile.user_id = current_user.id
    @submit_label = "Create"
  end
  def create
    @profile = Profile.new(params[:profile])
    @profile.user_id = current_user.id
    if @profile.save
      flash[:notice] = "Profile has been created."
      redirect_to :action => "index", :controller => "home"
    else
      flash[:notice] = "Profile has not been created."
      render :action => "new"
    end
  end
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:notice] = "Profile has been deleted."
    redirect_to :action => "index", :controller => "home"
  end
  def edit
    @profile = Profile.find(params[:id])
    @submit_label = "Update"
  end
  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Profile has been updated."
      redirect_to :action => "index", :controller => "home"
    end
  end
end
