enable :sessions

get '/' do
  p session[:id]
  # displays all posts
  erb :index
end

post '/login' do
  user = User.find_by_name(params[:name])
  if user != nil
    if params[:password] == user.password
      session[:id] = user.id
      session[:login] = true
      redirect "/"
    else
      session[:login] = false
      redirect '/login'
    end
  end
  session[:login] = false
  redirect '/login'

end

get "/login" do
  erb :login
end

get "/signin" do
  erb :sign_in
end

post "/signin" do
  user = User.create(name: params[:name], email: params[:email], password: params[:password] )
  session[:id] = user.id
  redirect '/'
end

get "/logout" do
  session.clear
  erb :index
end

get "/profile/:id" do
  erb :profile
end

get "/makePost" do
  erb :makePost
end

get "/post/:id" do
  erb :post
end

post "/post" do
  post = Post.create(title: params[:postTitle], user_id: session[:id], body: params[:postBody])
  redirect '/'
end

get "/makeComment/:id" do
  erb :comment
end

post "/makeComment/:id" do
  comment = Comment.create(user_id: session[:id], body: params[:postBody], post_id: params[:id])
  redirect '/post/'+params[:id]
end


get "/postVote/:id" do
  Postvote.create(post_id: params[:id])
  redirect '/post/'+params[:id]
end

get "/commentVote/:postid/:id" do
  Commentvote.create(comment_id: params[:id])
  redirect '/post/'+params[:postid]
end


