# MyMeals

Welcome to the MyMeals app! The app where you can store all of your restaurants and meals from your travels. In this application, you will be able to have your own secure account by either using the signup form or signing in through the Github Omniauth. Once your account is created, you will be directed to the User's dashboard where you can see all of your restaurant submissions. You can create, edit and delete restaurants and meals. You can also visit the restaurants page, where you will find, not only your submissions, but restaurants and meals from other users. You can search by city to view restaurants in the city you're visiting.

Installation

ruby version 2.6.1 

Add this line to your application's Gemfile:

gem 'mymeals'
And then execute:

$ bundle install
Or install it yourself as:

$ gem install mymeals

To run the program:

rails s

Usage

To start, run bundle install to make sure all of the necessary gems have been installed successfully.

Next, run rails s to be able to view the app on your localhost:3000.

You will be greeted to the homepage. Here, you can either signup or login to your account.

If you are a new user, you will need to create a valid username and password or signup through the Github link.

Once created, you will be redirected to the users dashboard where the user will have access to their restaurant submissions.

The user can click on any restaurant to view the name, location and meals associated with that restaurant.

Inside the restaurant page, you can add a new meal, or click on the meal to see the meal's name and description.

Inside of the meal page, you can edit or delete the meal (if you were the user who created that meal).

Once logged out, the user will now be able to login and have all of their information stored in the database for continued work.

Development
After checking out the repo, run bundle install to install dependencies.

To install this gem onto your local machine, run bundle exec rake install. To release a new version, update the version number in version.rb, and then run bundle exec rake release, which will create a git tag for the version, push git commits and the created tag, and push the .gem file to rubygems.org.

Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mymeals. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

License
The gem is available as open source under the terms of the MIT License.

Code of Conduct
Everyone interacting in the MyMeals project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.
