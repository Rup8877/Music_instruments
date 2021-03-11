class AddSubCategoryReferenceToMusicInstrumentsTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :music_instruments, :sub_category, foreign_key: true
  end
end
