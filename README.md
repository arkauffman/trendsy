# Trendsy

### Intro/Description
Trendsy is a web application in which a user can sign up or log into their account,
upload products, edit products, mark products inactive so they won't be shown on the home page, and reactivate their products.
A user has the ability to add items to their cart, increase or decrease the quantity of the item, delete an item from their cart, and check out. A user
can also view their order history, edit their profile, and manage their own personal products. Due to security reasons,
a default credit card and shipping/billing address were added since these products are just for show. A user can filter their products by clothing, jewelry, crafts, entertainment, home, bathroom, kids, or by showing all products. This is a full CRUD Ruby on Rails application. **No images are unique, they were found throughout the
web in order to show the capabilities of this
application.**

### Screenshot(s)
![Home](app/assets/images/home.png)
* Above is my default home page that includes the active images of products users have uploaded.

![Upload](app/assets/images/upload.png)
* Above is the upload page in which a logged in user can upload a title, price, quantity, description, and image for a product. All fields are required, if a quantity is set to 0, it is an inactive product and will not be shown on the home page, and if an image is not specified, a default image will be provided.
![Cart](app/assets/images/cart.png)
* Above is the default credit card and shipping/billing information for a user, and below the deactivated form is a table that holds information about their current cart.
![History](app/assets/images/history.png)
* Above is the order history page in which a user can see their current cart, as well as look at their past orders sorted by date.

### Technologies used
* HTML
    * Used to format web pages.
* CSS
    * Used to style web pages.
* Materialize CSS
    * Used for default forms, buttons, etc.
* Ruby
    * Used ERB within HTML views in order to display information from my models.
* Ruby on Rails
    * Used to store information about a user, product, and their cart.
* jQuery
    * Used to filter products with dropdown menu functionality.

### Links
* Check out Trendsy [here](https://trendsy.herokuapp.com/).
* Check out my Trello board [here](https://trello.com/b/YCyKuEL2/trendsy).

### Unsolved Problems
* User would not be able to upload a product with a quantity of 0.

### Future (Ice Box) Features
* Add sizing options for clothes.
* Add a feature where a product can have multiple images.
* Add a feature where an item can have different colors or types that a user could add to their cart.
* Adding more categories/sub-categories for products.