require "google/api_client"
require "google_drive"

class Contact < ActiveRecord::Base
	
	has_no_table
	attr_accessor :name, :string
	attr_accessor :email, :string
	attr_accessor :content, :string

	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :content
	validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
	validates_length_of :content, :maximum => 500
	#client ID: 921946829572-a3apsi5ao7stio091i1h8rbf09a3hu4b.apps.googleusercontent.com
	#client secret MlVS7wOd3UjYMp5PCiM4rGm9
	# Authorizes with OAuth and gets an access token.
	
	def update_spreadsheet
		#https://github.com/gimite/google-drive-ruby
		# solved the openssl problem: http://railsapps.github.io/openssl-certificate-verify-failed.html
		
		@client = Google::APIClient.new(application_name: 'Learn_Rails', application_version: '0.0.1')
		key = Google::APIClient::KeyUtils.load_from_pkcs12(ENV['GOOGLE_P12_PATH'], ENV['GOOGLE_P12_PASS'])
		#https://github.com/gimite/google-drive-ruby/issues/126#issuecomment-73542381
		#Share your sheets with the Client ID email of the service account ('someeailuser@developer.gserviceaccount.com'). 
		#Otherwise you won't be able to access anything even though you have a valid token.
		asserter = Google::APIClient::JWTAsserter.new( ENV['GOOGLE_SERVICE_EMAIL'],
    		['https://docs.google.com/feeds/',
    			'https://www.googleapis.com/auth/drive',
    		 'https://spreadsheets.google.com/feeds/'],
    		key
			)
		@client.authorization = asserter.authorize
		
		@connection = GoogleDrive.login_with_oauth(@client.authorization.access_token)
		ss = @connection.spreadsheet_by_title('Learn_Rails')
		if ss.nil?
			ss = @connection.create_spreadsheet('Learn_Rails')
		end
		ws = ss.worksheets[0]
		last_row = 1 + ws.num_rows
		ws[last_row, 1] = Time.new
		ws[last_row, 2] = self.name
		ws[last_row, 3] = self.email
		ws[last_row, 4] = self.content
		ws.save
		ws.reload
	end

end