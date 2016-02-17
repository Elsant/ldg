class IntroController < ApplicationController
  include Wicked::Wizard::Translated
  before_action :set_style, only: [:show, :update]

  steps :gender, :work, :evening, :shirtfit, :pantsfit, :stores, :shirtsize, :necksize, :jacketsize, :waistsize, :shoesize, :heightsize, :weightsize

  def show
    
    case  wizard_value(step)
    when "gender"  #, :work, :evening, :shirtfit, :pantsfit, :stores
      
      # session[:style] = nil
    when "work"
      # puts step
      # puts wizard_value(step)
      # render_wizard
    when :shirtsize
      # @sizeset = Sizeset.new
      # puts @sizeset
    end
    render_wizard
  end

  def update
    case wizard_value(step)

    when "gender"
      if @style
        @style.update_attributes(style_params)
        @style.save!
      else
        @style = Style.create(style_params)
      end
      session[:style_id] = @style.id
      render_wizard @style
    when "work", "evening", "shirtfit", "pantsfit"
      @style.update_attributes(style_params)
      render_wizard @style
    when "work", "evening", "shirtfit", "pantsfit", "stores"
      @style.update_attributes(style_params)
      render_wizard @style
    

    end
  end

  def finish_wizard_path
    new_user_registration_path 
  end

  private

  def set_style
    @style = Style.find_by(id: session[:style_id]) 
  end

  def style_params
    params.require(:style).permit( :gender_preference, :work_style, :evening_style, :shirt_fit, :pants_fit, :store)
  end


end
