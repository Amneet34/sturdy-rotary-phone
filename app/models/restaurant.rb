class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def Restaurant.fanciest
        return Restaurant.all.max_by{ |p| p.price }
    end
    
    def all_reviews
        return "Review for #{self.name} by #{customer.full_name}: #{review.star_rating} stars.",
                "Review for #{self.name} by #{customer.full_name}: #{review.star_rating} stars."
    end
end