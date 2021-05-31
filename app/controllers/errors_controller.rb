class ErrorsController < ApplicationController
    skip_before_action :validate_user

    def invalid_user

    end

end