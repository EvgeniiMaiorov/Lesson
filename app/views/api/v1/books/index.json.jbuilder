json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.author do
    json.id book.author.id 
    json.name book.author.name
  end
end
