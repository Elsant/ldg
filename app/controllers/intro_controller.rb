class IntroController < ApplicationController
  include Wicked::Wizard::Translated
  before_action :set_style_fav_store_and_sizeset, only: [:show, :update]

  steps :gender, :work, :evening, :shirtfit, :pantsfit, :stores, :shirtsize, :necksize, :jacketsize, :waistsize, :shoesize, :heightsize, :weightsize

  def show
    render_wizard
  end

  def update
    case wizard_value(step)
    when "gender" 
      if @style
        @style.update_attributes(style_params)
      else
        @style = Style.create(style_params)
        session[:style_id] = @style.id
      end
      render_wizard @style
      
    when "work", "evening", "shirtfit", "pantsfit"
      @style.update_attributes(style_params)
      render_wizard @style

    when "stores"
      if @fav_store
        @fav_store.update_attributes(fav_store_params)
      else
        @fav_store = FavStore.create(fav_store_params)
        session[:fav_store_id] = @fav_store.id
      end
      render_wizard @fav_store

    when "shirtsize"
      if @sizeset
        @sizeset.update_attributes(sizeset_params)
      else
        @sizeset = Sizeset.create(sizeset_params)
        session[:sizeset_id] = @sizeset.id
      end
      render_wizard @sizeset

    when "necksize", "jacketsize", "waistsize", "shoesize", "heightsize"
      @sizeset.update_attributes(sizeset_params)
      render_wizard @sizeset

    when "weightsize"
      @sizeset.update_attributes(sizeset_params)
      
      render_wizard @sizeset
    end
  end

  def finish_wizard_path
    session[:after_intro] = true
    new_user_registration_path 
  end

  private

  def set_style_fav_store_and_sizeset
    @style     ||= Style.find_by(id: session[:style_id]) 
    @sizeset   ||= Sizeset.find_by(id: session[:sizeset_id]) 
    @fav_store ||= FavStore.find_by(id: session[:fav_store_id]) 
  end

  def style_params
    params.require(:style).permit( :gender_preference, :work_style, :evening_style, :shirt_fit, :pants_fit)
  end

  def sizeset_params
    params.require(:sizeset).permit( :shirt, :neck, :jacket, :waist, :shoe, :height, :weight)
  end

  def fav_store_params
    params.require(:fav_store).permit(store: [])
  end

end
