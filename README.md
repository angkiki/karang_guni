# TO-DO List:

### Jodi:
* Seller (Implement Devise)
* ActionMailer
##### Columns for Seller Table:
* name
* email
* password
* hp
* address

### Bryan:
* Buyer (Implement Devise)
* Messaging
##### Columns for Buyer Table:
* name
* email
* password
* hp
* rating

### Gabriel:
* Request/Items (Implement One-Many, Nested Attributes)
* Request/Buyer (Many to Many, Join Table BuyersRequests)
##### Columns for Request
* seller_id
* title
##### Columns for Item
* request_id
* name
* description
* qty
