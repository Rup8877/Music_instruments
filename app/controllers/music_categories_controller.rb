# frozen_string_literal: true

class MusicCategoriesController < ApplicationController
  before_action :set_music_category, only: %i[show edit update destroy]

  def index
    @music_categories = MusicCategory.all
  end

  def show
@sub_categories=SubCategory.where(music_category_id: @music_category.id).order("created_at DESC")
  end

  def new
    @music_category = MusicCategory.new
  end

  def edit; end

  def create
    @music_category = MusicCategory.new(music_category_params)

    respond_to do |format|
      if @music_category.save
        format.html { redirect_to @music_category}
        format.json { render :show, status: :created, location: @music_category }
      else
        format.html { render :new }
        format.json { render json: @music_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @music_category.update(music_category_params)
        format.html { redirect_to @music_category, notice: 'Music category was successfully updated.' }
        format.json { render :show, status: :ok, location: @music_category }
      else
        format.html { render :edit }
        format.json { render json: @music_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @music_category.destroy
    respond_to do |format|
      format.html { redirect_to music_categories_url }
      format.json { head :no_content }
    end
  end

  private

  def set_music_category
    @music_category = MusicCategory.find(params[:id])
  end

  def music_category_params
    params.require(:music_category).permit(:category)
  end
end
