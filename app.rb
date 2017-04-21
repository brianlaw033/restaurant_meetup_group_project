require("bundler/setup")
Bundler.require(:default)

require('rickshaw')
require('rack')
require "sinatra/reloader"

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")

configure do
  enable :sessions
end

register do
  def auth (type)
    condition do
      redirect "/login" unless send("is_#{type}?")
    end
  end
end

helpers do
  def is_user?
    @user != nil
  end
end

before do
  if session[:id] == nil
    @user = nil
  else
    @user = User.find(session[:id])
  end
end

#index page links and buttons
get "/" do
  if @user == nil
    erb(:index)
  else
    redirect('/user')
  end
end

get("/login") do
  erb(:login)
end


post('/users') do
  username = params.fetch('username')
  password = params.fetch('password').to_sha1()
  @user = User.find_by(username: username, password: password)
  # not yet complete
  if @user != nil
    session[:id] = @user.id
    redirect('/user')
  else
    redirect('/')
  end
end

get("/sign_up") do
  erb(:sign_up)
end

post("/sign_up") do
  name = params.fetch('name')
  username = params.fetch('username')
  gender = params.fetch('gender')
  image = params.fetch('image')
  password = params.fetch('password').to_sha1()
  @user = User.new({:username => username, :name => name, :gender => gender,:image => image, :password =>password})
  if @user.save()
    session[:id] = @user.id
    redirect('/user')
  else
    erb(:errors)
  end
end
#test
get "/success", :auth => :user do
  erb(:success)
end

get("/admin") do
  @restaurants = Restaurant.all()
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

get("/user", :auth => :user) do
  @cuisines = Cuisine.all()
  @districts = District.all()
  @budgets = Budget.all()
  @timeslots = Timeslot.all()
  erb(:user)
end

patch("/user") do
  name = params.fetch("name")
  username = params.fetch("username")
  password = params.fetch("password")
  image = params.fetch("image")
  gender = params.fetch("gender")
  @user.update({:name => name, :username => username, :password => password, :image => image, :gender => gender})
  @users = User.all()
  redirect("/user")
end

patch("/user_preference") do
  cuisine_id = params.fetch("cuisine_id")
  district_id = params.fetch("district_id")
  budget_id = params.fetch("budget_id")
  timeslot_id = params.fetch('timeslot_id')
  gender_preference = params.fetch('gender_preference')
  @user.update({:cuisine_id => cuisine_id, :district_id => district_id, :budget_id => budget_id, :timeslot_id => timeslot_id, :gender_preference => gender_preference})
  redirect('/match_making')
end

get('/match_making') do
  @number = 0
  @users = @user.matchmake()
  @current_user = @user.matchmake[@number]
  erb(:match_making)
end

post('/match_cross') do
  @users = @user.matchmake()
  if params.fetch('count').to_i() < @users.length()-1
    @number = params.fetch('count').to_i() + 1
  else
    @number=0
  end
  @current_user = @user.matchmake[@number]
  erb(:match_making)
end

post('/match_tick') do
  @users = @user.matchmake()
  if params.fetch('count').to_i() < @users.length()-1
    @number = params.fetch('count').to_i() + 1
  else
    @number=0
  end
  @current_user = @user.matchmake[@number]
  @user_to_be_added = @user.matchmake[@number-1]
  @user.accept(@user_to_be_added)
  erb(:match_making)
end

get('/logout') do
  session.clear
  redirect('/')
end

get('/bingo') do
  @matches = @user.bingo()
  erb(:bingo)
end

get ('/restaurant/:id') do
  @budget = Budget.find(params.fetch("id").to_i())
  @cuisine = Cuisine.find(params.fetch("id").to_i())
  @district = District.find(params.fetch("id").to_i())
  @districts = District.all()
  @cuisines = Cuisine.all()
  @budgets = Budget.all()
  @restaurant = Restaurant.find(params.fetch("id").to_i())
  erb(:restaurant)
end

post ('/restaurant') do
  id = params.fetch("id").to_i()
  name = params.fetch("name")
  address = params.fetch("address")
  phone = params.fetch("phone").to_i()
  district_id = params.fetch("district_id").to_i()
  cuisine_id = params.fetch("cuisine_id").to_i()
  budget_id = params.fetch("budget_id").to_i()
  image = params.fetch("image")
  restaurant = Restaurant.create({:name => name, :address => address, :phone => phone, :district_id => district_id, :cuisine_id => cuisine_id, :budget_id => budget_id, :image => image})
  redirect("/restaurant/#{restaurant.id}")
end

patch("/restaurant/:id") do
  id = params.fetch("id").to_i()
  name = params.fetch("name")
  address = params.fetch("address")
  phone = params.fetch("phone").to_i()
  district_id = params.fetch("district_id").to_i()
  cuisine_id = params.fetch("cuisine_id").to_i()
  budget_id = params.fetch("budget_id").to_i()
  image = params.fetch("image")
  @restaurant = Restaurant.find(params.fetch("id").to_i())
  @restaurant.update({:name => name, :address => address, :phone => phone, :district_id => district_id, :cuisine_id => cuisine_id, :budget_id => budget_id, :image => image})
  redirect("/restaurant/#{id}")
end

delete("/restaurant/:id") do
  @restaurant = Restaurant.find(params.fetch("id").to_i())
  @restaurant.delete()
  redirect("/admin")
end
