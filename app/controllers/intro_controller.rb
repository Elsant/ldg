class IntroController < ApplicationController
  include Wicked::Wizard::Translated

  steps :gender, :work, :evening, :shirtfit, :pantsfit, :stores, :shirtsize, :waistsize, :shoesize, :heightsize,  :weightsize, :profile

  def show
    render_wizard
  end

  def finish_wizard_path
    user_path(current_user)
  end


end
