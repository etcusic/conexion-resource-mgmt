class DeckSearch
    attr_accessor :admin_approved, :level, :user_id

    DEFAULT_ATTRS = {
        admin_approved: "",
        level: "", 
        user_id: ""
    }

    def initialize(attributes=DEFAULT_ATTRS)
        attributes.each{ |key, value| self.send("#{key}=", value) }
    end

    def decks 
        Deck.where(self.as_hash)
    end

    def as_hash
        self.as_json.delete_if{|key, value| value == ""}
    end

end