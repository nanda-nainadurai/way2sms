require 'net/http'
require 'cgi'

class Way2sms
	def initialize(uname, pwd)
		puts "way2sms gem initialized"
		login_url = 'http://site25.way2sms.com/Login1.action'
		
		params = "username=" + uname + "&password=" + pwd
		uri = URI.parse(login_url)
		http = Net::HTTP.new(uri.host, uri.port)
		response = http.post(uri.request_uri, params)
		@cookie = response['Set-Cookie'].split(';').first	
	end

	def send_sms(to, message)
		cookie = @cookie
		puts cookie
		token = cookie.split('~').last

		sms_url = "http://site25.way2sms.com/smstoss.action"
		ref = "http://site25.way2sms.com/sendSMS?Token=" + token
		
		uri = URI.parse(sms_url)
		mess = "ssaction=ss&Token=" + token + "&mobile=" + to.to_s + "&message=" + CGI.escape(message)
		http = Net::HTTP.new(uri.host, uri.port)
		ct = "application/x-www-form-urlencoded"
		ua = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.94 Safari/537.36"
		head = {"Cookie" => cookie, "Referer" => ref, "Content-Type" => ct, "User-Agent" => ua}
		http.post(uri.request_uri, mess, head)
		puts "SMS sent succesfully"
	end
end