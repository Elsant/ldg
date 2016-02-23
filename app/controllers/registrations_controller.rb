class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?


  def new
    if session[:after_intro]
      session[:after_intro] = false
      build_resource({})
      respond_with self.resource
    else
      build_resource({})
      set_minimum_password_length
      yield resource if block_given?
      redirect_to intro_path(Wicked::FIRST_STEP)
    end
  end

  def create
    super

    # Remove this block in production
    if session[:force_signin] = true
      @style = Style.create
      @sizeset = Sizeset.create
      @fav_store = FavStore.create
    end
    # end of block to remove

    @style     ||= Style.find_by(id: session[:style_id]) 
    @sizeset   ||= Sizeset.find_by(id: session[:sizeset_id])
    @fav_store ||= FavStore.find_by(id: session[:fav_store_id])

    @style.user_id = resource.id
    @style.save
    @sizeset.user_id = resource.id
    @sizeset.save
    @fav_store.user_id = resource.id
    @fav_store.save
  end
  
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:firstname, :lastname, :phone, :zipcode, :email, :market_source, :password, :password_confirmation, :user, style: [:user_id], sizeset: [:user_id])}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) } 
    devise_parameter_sanitizer.for(:account_update) {
      |u| u.permit(:firstname, :lastname, :phone, :zipcode, :email, 
        :slug, :password, :password_confirmation, :current_password)}
  end

  protected

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

end

