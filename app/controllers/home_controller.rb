class HomeController < ApplicationController
  def index
    if current_user.present?
      @profile = current_user.profile
      if @profile != nil
        @channels = @profile.channels.page(params[:page])
      end
    end
  end
end
