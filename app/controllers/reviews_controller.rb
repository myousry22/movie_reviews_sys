class ReviewsController < ApplicationController
    before_action :set_movie, only: %i[index show edit update destroy new create]
    before_action :set_review, only: %i[show edit update destroy]
  
    # GET /reviews or /reviews.json
    def index
      @reviews = @movie.reviews
    end
  
    # GET /reviews/1 or /reviews/1.json
    def show; end
  
    # GET /reviews/new
    def new
      @review = @movie.reviews.build
    end
  
    # GET /reviews/1/edit
    def edit; end
  
    # POST /reviews or /reviews.json
    def create
      @review = @movie.reviews.build(review_params)
  
      respond_to do |format|
        if @review.save
          format.html { redirect_to movie_reviews_url, notice: 'Review was successfully created.' }
          format.json { render :show, status: :created, location: @review }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /reviews/1 or /reviews/1.json
    def update
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to movie_reviews_url, notice: 'Review was successfully updated.' }
          format.json { render :show, status: :ok, location: @review }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /reviews/1 or /reviews/1.json
    def destroy
      @review.destroy
  
      respond_to do |format|
        format.html { redirect_to movie_reviews_url, notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    def import
      return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
  
      unless params[:file].content_type == 'text/csv'
        return redirect_to request.referer,
                           notice: 'Only CSV files allowed'
      end
      ImportReviewCsv.new(params[:file]).call
      redirect_to request.referer, notice: 'Import started async, please refresh your page after some minutes..'
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