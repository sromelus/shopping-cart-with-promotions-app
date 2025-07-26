# Shopping Cart Application

A Ruby on Rails application that implements a shopping cart system with promotional discounts.

Designed Data Model -> https://excalidraw.com/#json=djRTqSw3ZwsjNnzEqK3MX,sOlzgMhiO-R0xe5zXUSp_A

## Features

- Browse items for sale - completed
- Add/remove items to cart - completed
- Support for both quantity-based and weight-based items - completed
- checkout - todo
- Promotional discount system
  - Flat fee discounts - completed
  - Percentage discounts - planned the work - todo
  - Buy X Get Y discounts - planned the work - todo
  - Weight threshold discounts - planned the work - todo
  - Category-based discounts - planned the work - todo

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   bundle install
   ```

3. Setup the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the server:
   ```bash
   rails server
   ```

## Technical Details

- Ruby version: 3.x
- Rails version: 7.2.2
- Database: SQLite3

## Testing

Run the test suite with:  rspec


## Dependencies

- Faker (for seed data)
- RSpec (for testing)
- Factory Bot (for test data)
- Shoulda Matchers (for testing)

## License

This project is open source and available under the [MIT License](LICENSE).