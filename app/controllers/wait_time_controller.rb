class WaitTimeController < ApplicationController
  
    def index
        @avg_wait_time = WaitTime.avg_wait_time
    end
  
    def create
        binding.pry
    end

end