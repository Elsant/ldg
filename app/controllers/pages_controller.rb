class PagesController < ApplicationController
  before_filter :authenticate_user!, :only => :home
  
  def index
    redirect_to(:home) if signed_in?
  end

  def home
    
  end
end
