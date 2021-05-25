class WaitTime < ApplicationRecord

    def self.avg_wait_time  
        total_time = 0
        number_of_waits = self.all.length
        self.all.each{|wait_time| total_time += wait_time.seconds}
        @avg_wait_time = total_time / number_of_waits
    end

end
