post '/post/new' do
  @p_details = params[:new]
  p @t_details = params[:tag]
  arr = []
  @new_post = Post.create(title: @p_details[:title],author: @p_details[:author],content: @p_details[:content])

   arr = @t_details.split
   arr.map! {|category| category.gsub(",","")}
   arr.each do |tag|
    @new_post.tags.find_or_create_by(category: tag)
     end
  redirect '/'
end

post '/post/:id/edit' do

  @details = params[:edit]
  @post = Post.find_by_id(params[:id])
  @post.update(title: @details[:title], content: @details[:content])
  redirect "/post/#{@post.id}"

end

get '/post/:id' do
  @categories_arr = []
  @post_tags = PostTag.all
  @post = Post.find(params[:id])
  @post_categories = @post.tags
  @post_categories.each do |name|
    @categories_arr << name.category
  end
  erb :post
end

get '/post/:id/edit' do

@post = Post.find(params[:id])
erb :edit

end

get '/post/:id/delete' do
  @post= Post.find(params[:id])
  @post.destroy

  redirect '/'
end
