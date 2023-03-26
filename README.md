# SUPERHEROS
This is a simple Rails API backend for tracking heroes and their superpowers.

# Getting Started
- Clone this repo
- Run bundle install
- Run rails db:migrate
- Run rails db:seed
- Run rails s
- Navigate to localhost:3000


## API Endpoints
GET /heroes: Returns a list of all heroes. GET /heroes/id Returns a hero with the specified id. GET /powers: Returns a list of all powers. GET /powers/id Returns a power with the specified id. PATCH /powers/id Updates the power with the specified id. POST /hero_powers: Creates a new hero power.

## Deployed API Endpoints at Render
GET Heroes: https://superhero-k24z.onrender.com/

GET Powers: https://superhero-k24z.onrender.com/powers

GET Hero Powers: https://superhero-k24z.onrender.com/hero_powers
