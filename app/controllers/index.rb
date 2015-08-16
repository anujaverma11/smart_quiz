enable :sessions

get '/' do
  redirect 'oauth/google'
end

get '/oauth/google' do
  redirect "https://accounts.google.com/o/oauth2/auth?client_id=#{ENV['CLIENT_ID']}&response_type=code&scope=openid%20email&redirect_uri=http://localhost:9393/oauth/google/redirect&state=#{ENV['STATE']}"
end

get '/oauth/google/redirect' do
  p "params: #{params}"
  if params[:error]
    p params[:error]
  else
    if params[:state] != ENV['STATE']
      p "HACKER ALERT"
    else
      p "so far so good"
      options = { "code" => params[:code],
                  "redirect_uri" => "http://localhost:9393/oauth/google/redirect",
                  "client_id" => ENV['CLIENT_ID'],
                  "client_secret" => ENV['CLIENT_SECRET'],
                  "grant_type" => "authorization_code" }
      token_response = HTTParty.post("https://www.googleapis.com/oauth2/v3/token", :body => options)

      token = token_response.parsed_response["access_token"]
      expires = token_response.parsed_response["expires_in"]
      jwt = token_response.parsed_response["id_token"]

      student_info_response = HTTParty.get("https://www.googleapis.com/oauth2/v3/userinfo", :headers => { "Authorization" => "Bearer #{token}" })
      p "student_info_response: #{student_info_response.parsed_response}"
      student = update_student_from_oauth(student_info_response.parsed_response, token, expires, jwt)
      p student.id
      session[:id] = student.id
      status 200 # this is not necessarily an accurate status number
    end
  end
end
