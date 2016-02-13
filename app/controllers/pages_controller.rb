class PagesController < ApplicationController
  def index
    redirect_to home_path if signed_in?
  end
  def home
  end
end
