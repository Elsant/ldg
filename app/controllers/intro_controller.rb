class IntroController < ApplicationController
  include Wicked::Wizard::Translated
  before_action :set_style_and_sizeset, only: [:show, :update]

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

    when "work", "evening", "shirtfit", "pantsfit", "stores"
      @style.update_attributes(style_params)
      render_wizard @style

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
      session[:after_intro] = true
      render_wizard @sizeset
    end
  end

  def finish_wizard_path
    new_user_registration_path 
  end

  private

  def set_style_and_sizeset
    @style   = Style.find_by(id: session[:style_id]) 
    @sizeset = Sizeset.find_by(id: session[:sizeset_id]) 
  end

  def style_params
    params.require(:style).permit( :gender_preference, :work_style, :evening_style, :shirt_fit, :pants_fit, store: [])
  end

  def sizeset_params
    params.require(:sizeset).permit( :shirt, :neck, :jacket, :waist, :shoe, :height, :weight)
  end

end
