class WaitTimeController < ApplicationController
  
    def index
        @avg_wait_time = WaitTime.avg_wait_time
    end
 
    def create
        int = params[:seconds].to_i
        @wait_time = WaitTime.create(seconds: int)
    end
 
end