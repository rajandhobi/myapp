xml.letters do
  @letters.each do |letter|
    xml.letter do
      xml.id    letter.id
      xml.title letter.title
      xml.body  letter.body
    end
  end
end
