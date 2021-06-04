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
        # 1) filter admin approved, 2) filter level, 3) filter user
        decks_array = filter_user(filter_level(filter_admin))
    end

    def filter_admin
        self.admin_approved == "" ? Deck.all : Deck.where("admin_approved = #{self.admin_approved}")
    end

    def filter_level(decks_array)
        self.level == "" ? decks_array : decks_array.where("level = #{self.level}")
    end

    def filter_user(decks_array)
        self.user_id == "" ? decks_array : decks_array.where("user_id = #{self.user_id}")
    end

    def all_users
        User.all
    end

end