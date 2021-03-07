# Cosmic Lounge

E-commerce sites are pretty complicated, but when you get to the core functionality, they really only do a few things:

1. Display a product with some details
2. Allow you to indicate that you want to purchase it by "adding" it to your "cart"
3. Allow you to manage your "cart"
4. Present you the cart, with any additional fees, for purchasing
5. Collect your address and payment information
6. Charge your credit card


## API

### Products

We don't want to complicate this too much but we really want to be able to see a list of categories of products and then a list of products in that category.  Also, we should be able to see a specific product.

 - `GET /categories`                  <- shows a list of categories
 - `GET /categories/{category}`       <- shows a list of products for that category
 - `GET /products/{product}`         <- shows detail of a given product

### Cart

You can add products to the cart, update product quantity in the cart, delete products from the cart and list the cart contents and total

* `GET /cart`    <- shows cart with total/status/etc
* `POST /cart`   <- add product to cart (creates cart if not created)
* `PUT /cart`    <- update product in cart (delete)

### Checkout

For checkout, you'll be shown the cart total/items and then enter your shipping address and billing information

 * `GET /checkout` <- show cart with address information
 * `POST /checkout` <- process checkout and redirect to order

### Order

 * `GET /orders/{order}` <- show order details and status
 * `GET /orders`         <- show all orders

## DB Schema

### Categories &
* uuid
* name
* timestamps

### Orders &
* uuid
* sub_total
* shipping_cost
* total
* user_id
* status
* order_date
* order_ip
* timestamps

### OrderProducts &
> holds information about the products in an order

* uuid
* order_id
* product_id
* sku
* name
* description
* price
* quantity
* subtotal
* timestamps

### OrderStatusHistories
> holds information about the changes in statii for an order

* uuid
* order_uuid
* previous_status
* new_status
* notes
* timestamps

### Products &
* uuid
* sku
* name
* description
* regular_price
* discounted_price
* stock_quantity
* lead_time
* timestamps

### ProductCategories &
> xref between products and categories - a category "has many" products and a product can "belong to" many categories

* id
* category_uuid
* product_uuid
* timestamps

### ProductImages &
* uuid
* product_uuid
* image_url
* default
* timestamps

### ProductTags &
* uuid
* product_uuid
* tag_uuid
* timestamps
### Tags &
* uuid
* tag
* timestamps

### Users &
* uuid
* email
* encrypted_password
* first_name
* last_name
* one_time_signin_token
* one_time_signin_token_sent_at
* sign_in_count
* current_sign_in_at
* last_sign_in_at
* current_sign_in_ip
* last_sign_in_ip
* failed_attempts
* locked_at
* timestamps

### UserSocialCredentials &
* uuid
* user_uuid
* provider
* provider_user_id
* provider_details
* timestamps
