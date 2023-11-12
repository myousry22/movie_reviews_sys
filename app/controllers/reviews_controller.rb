class ReviewsController < ApplicationController
    before_action :set_movie, only: %i[index show edit update destroy new create]
    before_action :set_review, only: %i[show edit update destroy]
  
    # GET /reviews 
    def index
      @reviews = @movie.reviews
    end
  
    # GET /reviews/1
    def show; end
  
    # GET /reviews/new
    def new
      @review = @movie.reviews.build
    end
  
    # GET /reviews/1/edit
    def edit; end
  
    # POST /reviews
    def create
      @review = @movie.reviews.build(review_params)
  
      respond_to do |format|
        if @review.save
          format.html { redirect_to movie_reviews_url, notice: 'Review was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /reviews/1 
    def update
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to movie_reviews_url, notice: 'Review was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /reviews/1
    def destroy
      @review.destroy
  
      respond_to do |format|
        format.html { redirect_to movie_reviews_url, notice: 'Review was successfully destroyed.' }
      end
    end
  
  
    private
  
    def set_review
      @review = @movie.reviews.find(params[:id])
    end
  
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
  
    def review_params
      params.require(:review).permit(:stars, :review, :movie_id)
    end
  end