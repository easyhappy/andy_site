require 'sinatra'
require 'active_record'
ActiveRecord::Base.establish_connection(
    :adapter  => 'mysql2',
    :database => 'mori_development',   #oracle service name
    :username => 'tianji',
    :password => 'tianji')
class Book < ActiveRecord::Base
end

get '/' do
  puts Book.first.id
end

post '/save' do
  tid = params['tid']
  bid = params['bid']
  if bid==-1
    redirect to('/')
  end
  t =  Temp2.where("tid=#{tid}").first
  if !t.nil?
    t.man_id = bid
    t.save
  end
  redirect to('/')
end

after do
  ActiveRecord::Base.connection.close
end
