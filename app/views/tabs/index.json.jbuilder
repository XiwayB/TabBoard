json.tabs do
  json.array! @tabs do |tab|
    json.extract! tab, :id, :title, :url, :icon, :folder_id
    end
end
