// Store product objects in an array
const cart = [
  { name: "Laptop", price: 60000, quantity: 1 },
  { name: "Mouse", price: 500, quantity: 2 },
  { name: "Keyboard", price: 1500, quantity: 1 }
];

// Calculate total cart value
// Using arrow function, map & reduce
const calculateTotal = (products) =>
  products
    .map(item => item.price * item.quantity)
    .reduce((sum, value) => sum + value, 0);

// Export module members
export { cart, calculateTotal };