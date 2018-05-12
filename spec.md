# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - install gem and have ApplicationController form Sinatra::Base
- [x] Use ActiveRecord for storing information in a database - models inherit from ActiveRecord::Base
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - add pet and user class
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts) - user has_many pets
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User) - pet belongs_to user
- [x] Include user accounts - user: hello
- [x] Ensure that users can't modify content created by other users - use sessions/current_user to prevent access without credentials
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - user can create, read, edit/update, and delete pet information
- [x] Include user input validations - requires user to enter pet's name
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - shows error message for login page if no user/pw entered; redirects to /pets/new and /pets/#{@pet.id}/edit if pet's name is not entered
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - see README

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
