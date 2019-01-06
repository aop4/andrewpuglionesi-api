class Song < ApplicationRecord
  belongs_to :album
  has_one_attached :song_file
  default_scope { order(:track_no) }
end
