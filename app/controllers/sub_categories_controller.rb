# frozen_string_literal: true

class SubCategoriesController < ApplicationController
  before_action :set_music_category

  def index
    @sub_categories = SubCategory.all
  end

  def show
    @sub_category = SubCategory.find(params[:id])
  end

  def new
    @sub_category = SubCategory.new
  end

  def create
    @sub_category = SubCategory.new(params.require(:sub_category).permit(:name))
    @sub_category.music_category_id = @music_category.id

    respond_to do |format|
      format.html { redirect_to music_category_path(@music_category) } if @sub_category.save
    end
  end

  def set_music_category
    @music_category = MusicCategory.find(params[:music_category_id])
  end
end
