class GetByNewsletterTypeId

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def to_xml
    "<getByNewsletterTypeIdRequest><newsletterTypeId>#{@id}</newsletterTypeId> </getByNewsletterTypeIdRequest>"
  end

  def to_hash
     {:getByNewsletterTypeIdRequest => {:newsletterTypeId => @id}}
  end

end