
helpers do
  def update_user_from_oauth(args, token, expires, jwt)
    user = User.find_by(email: args.fetch("email")) || User.new(email: args.fetch("email"))
    user.name = args.fetch("name")
    user.given_name = args.fetch("given_name")
    user.family_name = args.fetch("family_name")
    user.picture = args.fetch("picture")
    user.token = token
    user.expires = expires
    user.jwt = jwt
    user.save
    user
  end
end

