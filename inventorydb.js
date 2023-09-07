// Creatinf the databse
db = connect('mongodb://localhost/inventory');

// creating collections
db.createCollection('categories');
db.createCollection('products');
db.createCollection('roles');
db.createCollection('users');
db.createCollection('orders');
db.createCollection('order_details');
db.createCollection('admins');

// inseting into collections
db.categories.insertMany([
  { _id: 1, categoryName: 'trouser' },
  { _id: 2, categoryName: 'shirt' },
  { _id: 3, categoryName: 'shoe' },
]);

db.products.insertMany([
  {
    _id: 1,
    category_id: 2,
    name: 'demi jeans',
    price: 30.99,
    size: 'medium',
    image_url: 'https://image.demijeans.com',
    description: 'a nice demi jeans',
  },
  {
    _id: 2,
    category_id: 3,
    name: 'dessert boots',
    price: 90.99,
    size: 'small',
    image_url: 'https://image.dessetboots.com',
    description: 'a comfortable dessert boots',
  },
  {
    _id: 3,
    category_id: 2,
    name: 'Polo shirt',
    price: 10.0,
    size: 'large',
    image_url: 'https://image.polo.com',
    description: 'a nice polo top for outing',
  },
]);

db.roles.insertMany([
  { _id: 1, title: 'user' },
  { _id: 2, title: 'admin' },
]);

db.users.insertMany([
  {
    _id: 1,
    name: 'Kwesi Opoku',
    address: 'Bekwai,Kumasi',
    contact: '0205644522',
    email: 'opoku@example.com',
    password: 'nodejs',
    role_id: 1,
  },
  {
    _id: 2,
    name: 'Frank Bekoe',
    address: 'Legon,Accra',
    contact: '02112232552',
    email: 'frank@example.com',
    password: 'password',
    role_id: 2,
  },
  {
    _id: 3,
    name: 'Christy Ketor',
    address: 'Airport West,Accra',
    contact: '0244562202',
    email: 'ketor@example.com',
    password: 'deliverer',
    role_id: 2,
  },
]);

db.admins.insertOne({ _id: 1, name: 'Christy Ketor', user_id: 3, role_id: 2 });

db.orders.insertMany([
  {
    _id: 1,
    user_id: 1,
    status: 'approved',
    total: 144.0,
    updated_by: 3,
    created_at: Date(),
  },
  {
    _id: 2,
    user_id: 1,
    status: 'rejected',
    total: 311.0,
    updated_by: 3,
    created_at: Date(),
  },
  {
    _id: 3,
    user_id: 2,
    status: 'approved',
    total: 50.0,
    updated_by: 3,
    created_at: Date(),
  },
]);

db.order_details.insertMany([
  { _id: 1, order_id: 1, product_id: 1, quantity: 3, created_at: Date() },
  { _id: 2, order_id: 1, product_id: 3, quantity: 1, created_at: Date() },
  { _id: 3, order_id: 2, product_id: 2, quantity: 1, created_at: Date() },
  { _id: 4, order_id: 3, product_id: 1, quantity: 2, created_at: Date() },
  { _id: 5, order_id: 3, product_id: 3, quantity: 1, created_at: Date() },
]);

// Getting a document
db.users.find({ _id: 3 });
db.order_details.find({ order_id: 1, product_id: 1 });

db.admins.aggregate([
  {
    $lookup: {
      from: 'users',
      localField: 'user_id',
      foreignField: '_id',
      as: 'users',
    },
  },
]);

// updating a record
db.users.updateOne(
  { _id: 1 },
  {
    $set: {
      name: 'Kofi Opoku',
      address: 'Ablekuma, Accra',
    },
  }
);

db.orders.updateOne(
  { _id: 1 },
  { $set: { status: 'rejected', updated_by: 3 } }
);

// deleting records
db.products.deleteOne({ _id: 3 });
db.order_details.deleteOne({ _id: 1 });
