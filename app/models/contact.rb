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
		client = Google::APIClient.new
		auth = client.authorization
		auth.client_id = "921946829572-rnl43kp6t6s3gprb8enia95irimirpb8.apps.googleusercontent.com"
		auth.client_secret = "JIxf3Fpp-YdggKy66tvKkOG6"
		auth.scope = [
 		 "https://www.googleapis.com/auth/drive",
 		 "https://spreadsheets.google.com/feeds/"
		]
		auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
		print("1. Open this page:\n%s\n\n" % auth.authorization_uri) 
		#copy this link to browser then get the code
		#https://accounts.google.com/o/oauth2/auth?access_type=offline&client_id=921946829572-rnl43kp6t6s3gprb8enia95irimirpb8.apps.googleusercontent.com&redirect_uri=urn:ietf:wg:oauth:2.0:oob&response_type=code&scope=https://www.googleapis.com/auth/drive%20https://spreadsheets.google.com/feeds/
		print("2. Enter the authorization code shown in the page: ")
		auth.code = $stdin.gets.chomp
		auth.fetch_access_token!
		access_token = auth.access_token
		#http://stackoverflow.com/questions/26526322/get-token-store-it-refresh-it-if-expired-using-oauth2-gem-in-ruby
		
		connection = GoogleDrive.login_with_oauth(auth.access_token)
		ws = connection.spreadsheet_by_key('1eEfx29Y0e-zkCy8cQZ1Er_j6R8aTOP1fW52-O-mAzZY').worksheets[0]
		last_row = 1 + ws.num_rows
		ws[last_row, 1] = Time.new
		ws[last_row, 2] = self.name
		ws[last_row, 3] = self.email
		ws[last_row, 4] = self.content
		ws.save
		ws.reload
	end

end