class ImportMovieCsv
    require 'csv'
  
    def initialize(file)
      @file = file
    end
  
    def call
      movies = []
      CSV.foreach(@file.path, headers: true) do |row|
        to_hash = row.to_hash
        movie = {}
        movie['name'] = to_hash['Movie']
        movie['description'] = to_hash['Description']
        movie['director'] = to_hash['Director']
        movie['actor'] = to_hash['Actor']
        movie['year'] = to_hash['Year']
        movie['country'] = to_hash['Country']
        movie['filming_location'] = to_hash['Filming Location']
        movies << movie
      end
      ImportJob.perform_later('movie', movies)
    end
end