class Video < ApplicationRecord
  has_one_attached :video
  has_one_attached :thumbnail

  validates :title, :category, presence: true
  validate :video_type
  validate :video_size
  validate :thumbnail_type

  enum category: { exercise: 0, education: 1, recipe: 2 }

  private

  def video_type
    if video.attached? && !video.content_type.in?(%w[video/mp4 video/mov])
      errors.add(:video, ' must be in MP4 or MOV type.')
    elsif video.attached?.eql?(false)
      errors.add(:video, 'upload is mandatory.')
    end
  end

  def video_size
    errors[:video] << 'should be less than 200MB.' if video.byte_size > 200.megabytes
  end

  def thumbnail_type
    if thumbnail.attached?
      thumbnail.content_type.in?(%w[image/png image/jpeg image/jpg])
      errors.add(:thumbnail, ' must be in png, jpeg or jpg type.')
    end
  end
end
