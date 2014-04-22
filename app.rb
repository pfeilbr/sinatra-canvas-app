require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'
require 'dotenv'
require 'json'
require 'restforce'
require 'pp'

Dotenv.load
STDOUT.sync = true

class App < Sinatra::Base


	configure do
    # Allow the app to be pulled in through an iframe.
    set :protection, except: :frame_options
    #enable :sessions
    use Rack::Session::Pool
  end

	get '/' do
		#{}%{#{PP.pp(session[:signed_request], '')}}
		session[:signed_request]
		client = Restforce.new({
        oauth_token: session[:signed_request]['client']['oauthToken'],
        instance_url: session[:signed_request]['client']['instanceUrl']
      })

		soql = 'select Id, Name from Contact Limit 10'
		recs = client.query(soql).map{|r| r.to_hash}
		
		html = %{<h3>Signed Request</h3><pre>#{JSON.pretty_generate(session[:signed_request])}</pre>}
		html += %{<h3>#{soql}</h3><pre>#{JSON.pretty_generate(recs)}</pre>}
		
	end

	post '/canvas' do
		session[:signed_request] = Restforce.decode_signed_request(params[:signed_request], ENV['CLIENT_SECRET'])
		redirect '/'
	end

	run! if app_file == $0
end