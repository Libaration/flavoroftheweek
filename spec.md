# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)  (User has many posts)
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) (Songs belong to a user)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) Users have many liked posts through likes, Songs have many users through posts
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) Users have many songs through posts. Songs have many users through posts 
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) Comments have a message or content submittable by user
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) Login uses flash messages when incorrect password/email etc. Comments must have a message and can not be blank
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) Users have many liked posts where liked is true. Can be visible at the users show page.
- [x] Include signup (how e.g. Devise) Signup uses bcrypt and secure password
- [x] Include login (how e.g. Devise) Login uses authenticate method to log a user in and set session
- [x] Include logout (how e.g. Devise) Clears session data
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) Uses Omniauth to login/signup with Spotify
- [x] Include nested resource show or index (URL e.g. users/2/recipes) posts/:id/comments
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) originally was posts/:id/comments/new but now submits on the same page with ajax/js
- [x] Include form display of validation errors (form URL e.g. /recipes/new)  Login uses flash messages when incorrect password/email etc.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate