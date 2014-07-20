$LOAD_PATH << "."
require 'sinatra'
require 'haml'

get '/' do
  @images = Dir.glob("./public/*.png").map{|image|File.basename image}
  haml :index
end

__END__
@@ index
%h2 Hello images!!
- @images.each do |image|
  %p
    %img{:src=>"/#{image}", :alt=>''}
