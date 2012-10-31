# getNewsletter.rb
require 'sinatra'
require 'json'
require_relative 'auth_info'
require 'savon'
require 'active_support/core_ext'
require_relative 'get_by_newsletter_type_id'

before '/newsletterservice/*' do

  if env['X-auth-client'].nil? || env['X-auth-username'].nil? || env['X-auth-password'].nil?then
    error 400 do
      content_type :json
      {:error => 'Bad request'}.to_json
    end
  end

  @authinfo = AuthInfo.new(env['X-auth-client'], env['X-auth-username'], env['X-auth-password'])
	
end

get '/newsletterservice/bytypeid/:id' do |id|
  content_type :json

  client = Savon.client("https://td42.tripolis.com/api2/soap/NewsletterService?wsdl")
  auth = @authinfo #DIT IS RAAR

  response = client.request :get_by_newsletter_type_id do
    by_id = GetByNewsletterTypeId.new(id)
    soap.header = auth.to_xml
    soap.body = by_id.to_xml
  end

  response.body.to_json
end