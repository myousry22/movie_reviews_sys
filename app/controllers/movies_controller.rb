class MoviesController < ApplicationController
    before_action :set_movie, only: %i[show edit update destroy]
  
    # GET /movies or /movies.json
    def index
      @q = Movie.includes(:reviews).ransack(params[:q])
      @movies = @q.result
    end
  
    # GET /movies/1 or /movies/1.json
    def show; end
  
    # GET /movies/new
    def new
      @movie = Movie.new
    end
  
    # GET /movies/1/edit
    def edit; end
  
    # POST /movies or /movies.json
    def create
      @movie = Movie.new(movie_params)
  
      respond_to do |format|
        if @movie.save
          format.html { redirect_to movie_url(@movie), notice: 'Movie was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /movies/1 or /movies/1.json
    def update
      respond_to do |format|
        if @movie.update(movie_params)
          format.html { redirect_to movie_url(@movie), notice: 'Movie was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /movies/1 or /movies/1.json
    def destroy
      @movie.destroy
  
      respond_to do |format|
        format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      end
    end
  
    private

  
    def set_movie
      @movie = Movie.find(params[:id])
    end
  
    def movie_params
      params.require(:movie).permit(:name, :description, :year, :director, :actor, :filming_location, :country)
    end
  end