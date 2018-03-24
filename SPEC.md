# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
    - User has_many Positions, Boats
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
    - Position/Boat belongs_to User
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
    - User has_many RaceCrews, has_many Crews through RaceCrews
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
    - User sets skill_level attribute on PositionsUser object
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - User, Boat, Position, Race, Regatta have validations on model attributes
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
    - Form to manage profile positions (/user/:id/position-management) writes to associated PositionsUser model through custom attribute writer in User model, positions_users_attributes=()
- [x] Include signup (how e.g. Devise)
    - Signup uses Devise gem
- [x] Include login (how e.g. Devise)
    - Login uses Devise gem
- [x] Include logout (how e.g. Devise)
    - Logout uses Devise gem
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - User can signup/login via OmniAuth (Facebook), with Devise
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - users/user_id/positions (index), users/user_id/boats (index)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
    - users/user_id/boats/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - all forms display validation errors

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
