json.extract! video, :id, :title, :category, :image_64, :image_128, :image_256, :created_at, :updated_at
json.url video_url(video, format: :json)
