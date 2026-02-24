// Import data and function from cart.js
import { cart, calculateTotal } from "./cart.js";

// Get invoice container
const invoiceDiv = document.getElementById("invoice");

// ================================
// Display invoice on the screen
// ================================
const displayInvoice = (products) => {

  products.forEach(({ name, price, quantity }) => {
    invoiceDiv.innerHTML += `
      <div class="item">
        <span>${name} (${quantity})</span>
        <span>₹${price * quantity}</span>
      </div>
    `;
  });

  invoiceDiv.innerHTML += `
    <div class="total">
      Grand Total: ₹${calculateTotal(products)}
    </div>
  `;
};

// Execute function
displayInvoice(cart);