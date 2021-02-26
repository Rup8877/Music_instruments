# frozen_string_literal: true

class MusicInstrumentsController < ApplicationController
  before_action :set_music_instrument, only: %i[show edit update destroy approve reject]
  before_action :authenticate_user!, except: %i[search home]
  # GET /music_instruments
  # GET /music_instruments.json
  def index
    @music_instruments = MusicInstrument.all
  end

  # GET /music_instruments/1
  # GET /music_instruments/1.json
  def show
    @reviews = Review.where(music_instrument_id: @music_instrument.id).order('created_at DESC')

    if @reviews.blank?
    @avg_review = 0
      else
    @avg_review = @reviews.average(:rating).round(2)
        end
    @conversation = Conversation.where(music_instrument_id: @music_instrument.id)
  end

  def home
    if params[:category].blank?
      @music_instruments = MusicInstrument.all.order('created_at DESC')
    else
      @music_category_id = MusicCategory.find_by(category: params[:category])
      @music_instruments = MusicInstrument.where(music_category_id: @music_category_id).order('created_at DESC')
    end
  end

  def buyer_posts
    @music_instruments = MusicInstrument.where(role: 'buyer')
  end

  def seller_posts
    @music_instruments = MusicInstrument.where(role: 'seller')
  end

  def approve
    @music_instrument.update(approved_by: true)
    redirect_to '/admin'
  end

  def reject
    @music_instrument.update(approved_by: nil)
    redirect_to '/admin'
  end

  def posted_items
    @music_instruments = MusicInstrument.where(role: 'buyer')
  end

  def filter_by_date
    @music_instruments = MusicInstrument.where('created_at between (?) and (?)', params[:start_date],
                                               params[:end_date])
  end

  def filter_by_price
    @music_instruments = MusicInstrument.where('price <= ? ', params[:price])
  end

  def required_items
    @music_instruments = MusicInstrument.where(role: 'seller')
  end

  def send_mail
    NotificationMailer.with(user: current_user).send_notification_mail.deliver_now!
    redirect_to root_path
  end

  # GET /music_instruments/new
  def new
    @music_instrument = MusicInstrument.new
  end

  # GET /music_instruments/1/edit
  def edit; end

  # POST /music_instruments
  # POST /music_instruments.json
  def create
    @music_instrument = MusicInstrument.new(music_instrument_params)

    respond_to do |format|
      if @music_instrument.save
        format.html { redirect_to @music_instrument, notice: 'music instrument created'}
        format.json { render :show, status: :created, location: @music_instrument }
      else
        format.html { render :new }
        format.json { render json: @music_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /music_instruments/1
  # PATCH/PUT /music_instruments/1.json
  def update
    respond_to do |format|
      if @music_instrument.update(music_instrument_params)
        format.html { redirect_to @music_instrument, notice: 'music instrument updated' }
        format.json { render :show, status: :ok, location: @music_instrument }
      else
        format.html { render :edit }
        format.json { render json: @music_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /music_instruments/1
  # DELETE /music_instruments/1.json
  def destroy
    @music_instrument.destroy
    respond_to do |format|
      format.html { redirect_to music_instruments_url, notice: 'Music instrument  destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    if params[:search].present?
      @music_instruments = MusicInstrument.search(params[:search])
    else
      @MusicInstruments = MusicInstrument.all
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_music_instrument
    @music_instrument = MusicInstrument.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def music_instrument_params
    params.require(:music_instrument).permit(:item_tittle, :music_category_id, :item_description, :user_id,
                                             :phone_number, :price, :role, :approved_by, images: [])
  end
end
