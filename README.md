# ninety-nine-bricks

tldr
---
A simple, self-contained brick marketplace for diversified investment.

requirements
---
`ruby >= 3`
`rails >= 7`
`Postgresql >= 14`

setup
---
nothing out of the ordinary here - 
`bundle install` to install dependencies
`rspec` to run tests

optional but **recommended** run initial seed
`rake devcam:build_demo` to seed database

`rails db:create, migrate and all that jazz`
`rails s`

interesting urls
---
`http://localhost:3000/realties` - list of all realties
`http://localhost:3000/offers` - very very primitive ui to add and remove bricks to carts (must be done trough ids)
`http://localhost:3000/users` - very very primitive ui to handle users
`http://localhost:3000/shopping_carts/` - very very primitive ui to handle users


things I wish I implemented better
---

* better U.I to add and remove bricks from shopping_carts
* lock transactions such that at a certain stage, offers could not be edited (*i.e at review*).
* General error checking outside happy path ( getting bad users, bad carts, bad realties etc)