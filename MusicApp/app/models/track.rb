# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  bonus      :boolean          default(FALSE), not null
#  album_id   :integer          not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :name, :album_id, presence: true

  belongs_to :album
  has_many :notes
  has_one(
    :band,
    through: :album,
    source: :band
  )
end
