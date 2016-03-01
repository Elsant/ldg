class OccasionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_occasion, only: [:show, :edit, :update, :destroy]

  def new
    @occasion = Occasion.new
  end

  def create
    @occasion = current_user.occasions.build(occasion_params)

    if @occasion.save
      redirect_to auth_root_path
    else
      render :new 
    end
  end

  private
    def set_occasion
      @occasion = Occasion.find(params[:id])
    end

    def occasion_params
      params.require(:occasion).permit(:user_id, :title, :style, :occasion_time)
    end

end
