class VisitorsController < ApplicationController
  skip_before_action :validate_user, :require_login
  
  def index
  end

end
