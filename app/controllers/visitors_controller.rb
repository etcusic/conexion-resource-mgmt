class VisitorsController < ApplicationController
  before_action :current_user, :validate_user 
  
  def index
  end

end
