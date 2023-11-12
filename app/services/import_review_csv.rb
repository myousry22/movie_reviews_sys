class ImportReviewCsv
    require 'csv'
  
    def initialize(file)
      @file = file
    end
  
    def call
      reviews = []
      CSV.foreach(@file.path, headers: true) do |row|
        rows = row.to_hash
        review = {}
        movie = Movie.find_by(name: rows['Movie'])
        if movie.present?
          review['movie_id'] = movie.id
          review['stars'] = rows['Stars']
          review['review'] = rows['Review']
          review['user'] = rows['User']
        end
        reviews << review
      end
      ImportJob.perform_later('review', reviews)
    end
  end