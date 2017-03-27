class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = current_user.appearances.build(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])
    @appearance.update(appearance_params)
    redirect_to @appearance.episode
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

end
