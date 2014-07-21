$LOAD_PATH << "."
require 'sinatra'
require 'haml'
require 'cgi'

get '/' do
  #@images = Dir.glob("./public/*.png").map{|image|File.basename image}
  @images = []
  haml :index
end

get '/url' do
  @images = Dir.glob("./public/#{CGI.escape params[:url]}/*.png")
  haml :index
end

post '/shot' do
  url = params[:url]
  #FIXME
  #danger
  `/chrome-shot.rb "#{url}"`
  url = CGI.escape url
  redirect to("/url?url=#{url}")
end

get '/png/:image' do
  send_file File.join(settings.public_folder, CGI.escape(params[:folder]), params[:image])
end

__END__
@@ index
%h2 Hello images!!
%div
  %form{:action=>'/shot', :method=>'POST'}
    %input{:type=>'text', :name=>'url'}
    %input{:type=>'submit'}
%p
  = params[:url]
%p
  = @images.size
- @images.each do |image|
  - image = image.gsub /\A.+public/, ''
  - elements = image.split('/')
  %p
    %img{:src=>"/png/#{elements.last}?folder=#{elements[-2]}", :alt=>''}
