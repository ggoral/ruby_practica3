require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def current_user
    @current_user ||= Hashie::Mash.new(admin?: [true, false].sample)
  end
  
  def edit_article_url(article)
    "http://example.com/articles/#{article.id}/edit"
  end

  def author_url(author)
    "http://example.com/authors/#{author.id}"
  end
end

get '/' do
  @article = Hashie::Mash.new(id: 1, name: "DRAGONBUSTER02", published_at:"2012-01-10")
  @article.author = Hashie::Mash.new(id: 1, name: "Mizuhito Akiyama")
  @article.comments = Array.new(1) { |i| Hashie::Mash.new(id: i+1, name: "@ikm", content: "My missing book...") }
 
  jbuilder :index
end

get '/resourses' do
  erb :index
end
