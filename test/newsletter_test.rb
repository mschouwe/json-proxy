require_relative '../newsletters'
require 'test/unit'
require 'rack/test'

class NewsletterTest   < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def  test_newsletters_get_by_type_id
    get '/newsletterservice/bytypeid/MTAzNzEwMzdG6YnOWev5Xw', nil,{"X-auth-client" => "CLIENT" , "X-auth-username" => "USERNAME" , "X-auth-password" => "PASSWORD"}
    assert last_response.ok?
    assert_equal '{"get_by_newsletter_type_id_response":{"response":{"paging":{"page_nr":"1","page_size":"15","total_items":"1"},"newsletters":{"newsletter":{"id":"ODY1NTM4NjUZV*pbYzrjYw","newsletter_type_id":"MTAzNzEwMzdG6YnOWev5Xw","label":"NB1","name":"nb1","subject":"Test","from_address":"martijn@tripolis.com","from_name":"Tripolis","reply_to_address":null,"modified_at":"2012-10-22T12:53:46+02:00","is_archived":false}}},"@xmlns:ns2":"http://newsletter.services.tripolis.com/","@xmlns:ns3":"http://services.tripolis.com/","@xmlns:ns4":"http://contact.services.tripolis.com/"}}', last_response.body
    #last_request.env["HTTP_X_MY_AWESOME_HEADER"]
  end

  def test_newsletters_get_by_type_id_with_auth_fault
    get '/newsletterservice/bytypeid/MTAzNzEwMzdG6YnOWev5Xw', nil,{ "X-auth-username" => "mschouwe@tripolis.com" , "X-auth-password" => "Martijn123"}
    assert last_response.client_error?
  end

end