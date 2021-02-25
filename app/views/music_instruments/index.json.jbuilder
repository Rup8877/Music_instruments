# frozen_string_literal: true

json.array! @music_instruments, partial: 'music_instruments/music_instrument', as: :music_instrument
