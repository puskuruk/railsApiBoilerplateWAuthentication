# What is it for?
This is a boilerplate for who needs a rails api with authentication layer.

# Dependencies
`jwt_sessions', '~> 2.3`

# Routes
* post => /signin == sign in which is in signin controller's create method
* delete => /signin == sign out which is in signin controller's destroy method
* post => /signup == sign up which is in signup controller's create method
* post => /refresh == refresh token which is in refresh controller's create method

# Author
Tamay Eser Uysal