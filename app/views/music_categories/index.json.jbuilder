# frozen_string_literal: true

json.array! @music_categories, partial: 'music_categories/music_category', as: :music_category
