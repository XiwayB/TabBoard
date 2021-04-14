json.folders do
  json.array! @folders do |folder|
    json.extract! folder, :id, :name, :coverimg, :user_id
    end
end
