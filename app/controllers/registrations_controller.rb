class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?


  def new
    #!!!! REMOVE
    # session[:after_intro] = false
    # session[:style_id]= nil

    if session[:after_intro]
      puts "AFTER INTRO", session[:after_intro]
      # build_resource(session[:blduser])
      session[:after_intro] = false
      bld = build_resource({})

      build_style_and_sizeset (bld)

      respond_with self.resource
    else
      build_resource({})
      set_minimum_password_length
      yield resource if block_given?
      blduser = self.resource
      # blduser[:firstname] = "Ivan"
      puts "BLDUSER", blduser.object_id
      session[:after_intro] = true
      redirect_to intro_path(Wicked::FIRST_STEP) #, :locals => {@user => self.resource} 
    end
    
  end
  
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:firstname, :lastname, :phone, :zipcode, :email, :market_source, :password, :password_confirmation, :user, :style, :sizeset)}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) } 
    devise_parameter_sanitizer.for(:account_update) {
      |u| u.permit(:firstname, :lastname, :phone, :zipcode, :email, 
        :slug, :password, :password_confirmation, :current_password)}
  end

  protected

  def build_style_and_sizeset (user)
    # @style   = Style.find_by(id: session[:style_id]) 
    # @sizeset = Sizeset.find_by(id: session[:sizeset_id])
    # user.build_style(@style) 
    # user.build_sizeset(@sizeset)
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

end

