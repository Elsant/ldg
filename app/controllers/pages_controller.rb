class PagesController < ApplicationController
  before_filter :authenticate_user!, :only => :home
  
  def index
    if signed_in? 
      redirect_to(:home)
    else
      redirect_to new_user_session_path 
    end
  end

  def home
    
  end
end
