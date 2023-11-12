class ReviewObserver < ActiveRecord::Observer
    def after_commit(review)
      movie = review.movie
      movie.update(average_rating: movie.calc_average_rating)
    end
end