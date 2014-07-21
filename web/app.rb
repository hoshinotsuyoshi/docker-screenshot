$LOAD_PATH << "."
require 'sinatra'
require 'haml'
require 'cgi'

get '/' do
  @images = []
  @links  = Dir.glob("./public/*")
  haml :index
end

get '/url' do
  @images = Dir.glob("./public/#{CGI.escape params[:url]}/*.png")
  @links  = []
  haml :index
end

get '/png/:image' do
  send_file File.join(settings.public_folder, CGI.escape(params[:folder]), params[:image])
end

__END__
@@ index
%h2 Hello images!!
%p
  = params[:url]
- @links.each do |link|
  - link = link.gsub /\A.+public/, ''
  - url = link.split('/').last
  %p
    %a{:href=>"/url?url=#{url}"}
      = CGI.unescape(url)
- @images.each do |image|
  - image = image.gsub /\A.+public/, ''
  - elements = image.split('/')
  %p
    %img{:src=>"/png/#{elements.last}?folder=#{elements[-2]}", :alt=>''}
