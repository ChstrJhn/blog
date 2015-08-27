get '/tag/list' do 
 @tags = Tag.all

 erb :tag
end

get '/tag/list/:category' do

  @tag = Tag.find_by(category: params[:category])
  @posts_by_tag = @tag.posts
  erb :postsbytag
end
