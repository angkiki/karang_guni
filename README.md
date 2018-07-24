#TO-DO List:

### Jodi:
* Seller (Implement Devise)
##### Columns for Seller Table:
* name
* email
* password
* hp
* address

### Bryan:
* Buyer (Implement Devise)
##### Columns for Buyer Table:
* name
* email
* password
* hp
* rating

### Gabriel:
* Request/Items (Implement One-Many, Nested Attributes)
##### Columns for Request
* seller_id
* title
##### Columns for Item
* request_id
* name
* description
* qty
