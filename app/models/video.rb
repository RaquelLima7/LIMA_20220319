class Video < ApplicationRecord
  has_one_attached :video
  has_one_attached :thumbnail

  validates :title, presence: true
  validates :category, presence: true
  validates_presence_of :video, message: 'upload is mandatory.'
  validate :video_type
  validate :video_size
  validate :thumbnail_type

  enum category: { exercise: 0, education: 1, recipe: 2 }

  private

  def video_type
    return unless video.attached? && !video.content_type.in?(%w[video/mp4 video/mov])

    errors.add(:video, ' must be in MP4 or MOV type.')
  end

  def video_size
    return unless video.attached? && video.byte_size > 200.megabytes

    errors.add(:video, 'should be less than 200MB.')
  end

  def thumbnail_type
    return unless thumbnail.attached? && !thumbnail.attachment.blob.content_type.in?(%w[image/png image/jpeg image/jpg])

    errors.add(:thumbnail, 'must be an image file.')
  end
end
