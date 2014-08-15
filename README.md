# Sample Sinatra Canvas App

A salesforce canvas app built using sinatra.  Uses [restforce](https://github.com/ejholmes/restforce) to decode the signed request from salesforce.


## Running

1. Install [Tunnels](https://github.com/jugyo/tunnels)

		gem install tunnels

2. Run app locally and note the port (5000 in the usual case)

		foreman start

3. Run tunnels.  Change the destinattion port (5000) if needed

		rvmsudo tunnels 443 5000

4. Navigate to https://localhost/canvas in browser and accept SSL issue (not trusted)

5. Login to salesforce org (e.g. brian.pfeil.1@gmail.com) and visit visualforce page at

		/apex/CanvasAppExample

## Resources

* [Sample Ruby on Rails Force.com Canvas App](http://blog.jeffdouglas.com/2014/03/04/sample-ruby-on-rails-force-com-canvas-app/?utm_source=feedly&utm_reader=feedly&utm_medium=rss&utm_campaign=sample-ruby-on-rails-force-com-canvas-app)
* [Sample Force.com Sinatra app](https://gist.github.com/ejholmes/4052312)