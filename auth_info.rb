class AuthInfo

  attr_accessor :client,:username,:password

  def initialize(client,username,password)
     @client = client
     @username = username
     @password = password
     @namespace = "ins0" # Have to get this from Soap if possible
  end

  def to_s
    "AuthInfo : #{@client} #{@username} #{@password}"
  end

  def to_xml
    "<#{@namespace}:authInfo>\n<client>#{@client}</client>\n<username>#{@username}</username>\n<password>#{@password}</password>\n</#{@namespace}:authInfo>"
  end

  def to_hash
    {:client => @client , :username => @username , :password => @password}
  end
end