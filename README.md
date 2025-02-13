# Book Lending Library

A simple book lending library application built with Ruby on Rails 8.

## Setup

1. Clone the repository:
   
  ```bash
  git clone https://github.com/your-username/book-library.git
  cd book-library
  ```

2. Install dependencies:

  ```bash
  bundle install
  yarn install
  ```

3. Set up the database:

  ```bash
  rails db:setup
  ```

4. Populate the database with random books:

  ```bash
  rails db:seed
  ```
5. Run the application:

  ```bash
  rails server
  ```
6. Visit http://localhost:3000 in your browser.

## Running Tests
Run the test suite with:

```bash
rails test
```

### Generating Random Books
To populate the database with random books for development, run:

```bash
rails db:seed
This will create 50 random books using the Faker gem.
```

### Play Around with the Data
After running `rails db:seed`, you can start the Rails server and visit `http://localhost:3000` to see the random books in action. You can also use the Rails console to interact with the data:

```bash
rails console
```
In the console, you can query the books:

```ruby
Book.count # Should return 50
Book.first # Returns the first book
Book.last # Returns the last book
```






