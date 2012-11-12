class ChannelsController < ApplicationController
  #before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :find_profile
  before_filter :find_channel, :only => [:show, :edit, :update, :destroy]
  def new
    @channel = Channel.new
    @channel.profile_id = @profile.id
    @submit_label = "Create"
  end
  def create
    @channel = Channel.new(params[:channel])
    @channel.profile_id = @profile.id
    if @channel.save
      flash[:notice] = "Channel has been created."
      redirect_to :action => "index", :controller => "home"
    else
      flash[:notice] = "Channel has not been created."
      render :action => "new"
    end
  end
  def update
    if @channel.update_attributes(params[:channel])
      flash[:notice] = "Channel has been updated."
      redirect_to :action => "index", :controller => "home"
    else
      flash[:notice] = "Channel has not been edited."
      render :action => "edit"
    end
  end
  def destroy
    @channel.destroy
    flash[:notice] = "Channel has been deleted."
    redirect_to :action => "index", :controller => "home"
  end
  def edit
    @submit_label = "Update"
  end
  def show
  end
private
  def find_profile
    @profile = Profile.find(params[:profile_id])
  end
  def find_channel
    @channel = @profile.channels.find(params[:id])
  end
end
