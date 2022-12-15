class Customer < ActiveRecord::Base
    has_many :reviews, through: :customers
    has_many :restaurants
    def full_name
        return "#{self.first_name} #{self.last_name}"
    end
    def favorite_restaurant
        return Review.all.max_by { |r| r.star_rating }
    end
    def add_review(restaurant, rating)
        new_review = Review.create(name: name, price: price, first_name: first_name, last_name: last_name, restaurant_id: restaurant_id, rating: rating, customer_id: self.id)
    end
    def delete_reviews(restaurant)
        restaurant.each(&:review).destroy 
    end

end