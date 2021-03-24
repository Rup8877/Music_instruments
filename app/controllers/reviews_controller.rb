# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  before_action :set_music_instrument
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show; end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.music_instrument_id = @music_instrument.id
    if @review.save
      redirect_to music_instrument_path(@music_instrument)
    else
      flash[:notice] = ' Invalid Rating or Feedback '
      redirect_to music_instrument_path(@music_instrument)
    end
  end

  def update
		if @review.update(review_params)
			redirect_to music_instrument_path(@music_instrument)
		else
			redirect_to music_instrument_path(@music_instrument)
		end
	end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:rating, :feedback)
  end

  def set_music_instrument
    @music_instrument = MusicInstrument.find(params[:music_instrument_id])
  end
end
