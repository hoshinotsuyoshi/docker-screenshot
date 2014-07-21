$LOAD_PATH << "."
require 'sinatra'
require 'haml'

get '/' do
  @images = Dir.glob("./public/*.png").map{|image|File.basename image}
  haml :index
end

post '/shot' do
  url = params[:url]
  #FIXME
  #danger
  `/chrome-shot.rb "#{url}"`
  redirect to('/')
end

__END__
@@ index
%h2 Hello images!!
%div
  %form{:action=>'/shot', :method=>'POST'}
    %input{:type=>'text', :name=>'url'}
    %input{:type=>'submit'}

- @images.each do |image|
  %p
    %img{:src=>"/#{image}", :alt=>''}
