get '/' do
  @posts = Post.all
  @tags = Tag.all
  erb :index
end

