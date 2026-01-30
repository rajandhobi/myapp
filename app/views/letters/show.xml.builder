xml.letter do
  xml.id  @letter.id
  xml.title @letter.title
  xml.body  @letter.body
  xml.created_at @letter.created_at
end
