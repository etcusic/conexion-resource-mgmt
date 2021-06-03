class DeckSearch
    attr_accessor :admin_approved, :level, :user_id

    def initialize(params)
        binding.pry
        params.each{|key, value| self.send(("#{key}="), value)}
        binding.pry
    end

end