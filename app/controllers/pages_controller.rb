class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  
  def index
  end
  
  def about
  end
  
  def main
  end
end
