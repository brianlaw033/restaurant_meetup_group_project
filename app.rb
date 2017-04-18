require("bundler/setup")
Bundler.require(:default)
require('pry')
require('rickshaw')
require('rack')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")

configure do
  enable :sessions
end

#index page links and buttons
get("/") do
  erb(:index)
end

get("/login") do
  erb(:login)
end

post('/users') do
  username = params.fetch('username')
  password = params.fetch('password').to_sha1()
  @user = User.find_by(username: username, password: password)
  # not yet complete
  redirect('/')
end

get("/sign_up") do
  erb(:sign_up)
end

post("/sign_up") do
  name = params.fetch('name')
  username = params.fetch('username')
  image = params.fetch('image')
  password = params.fetch('password').to_sha1()
  @user = User.create({:username => username, :name => name, :image => image, :password =>password})
  session[:id] = @user.id
  redirect('/success')
end

get ("/success") do
  session[:id]
  @user = User.find(session[:id])
  erb(:success)
end

get("/user") do
  erb(:user)
  password = params.fetch('password')
  User.create({:username => username, :name => name, :image => image, :password =>password}) #create is the equivalent of user = User.new plus user.save()
  redirect('/')
end

get("/admin") do
  erb(:admin)
end

post("/admin") do
  cuisineName = params.fetch("cuisine")
  districtName = params.fetch("district")
  budgetName = params.fetch("budget")
  Cuisine.where(:name => cuisineName).first_or_create({:name => cuisineName})
  District.where(:name => districtName).first_or_create({:name => districtName})
  Budget.where(:scale => budgetName).first_or_create({:scale => budgetName})
  redirect('/admin')
end

get("/user/:id") do
  @cuisines = Cuisine.all()
  @districts = District.all()
  @budgets = Budget.all()
  @user = User.find(params.fetch('id'))
  erb(:user)
end

post("/user") do
  @cuisine = params.fetch("cuisine")
  @district = params.fetch("district")
  @budget = params.fetch("budget")
  redirect('/user')
end