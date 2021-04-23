require 'open-uri'

class AttachPhotoWorker
  include Sidekiq::Worker

  def perform(folder_id)
    # Do something
    # find the folder (need folder id)
    # attach unsplash photo to this folder
    folder = Folder.find(folder_id)
    folder.attach_unsplash

  end
end
