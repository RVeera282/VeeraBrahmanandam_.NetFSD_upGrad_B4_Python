/*****************************************************
 * GLOBAL SCOPE
 * Requirement ✔
 * Counter value is maintained outside the function
 *****************************************************/
let counter = 0;

/*****************************************************
 * Function: incrementCounter(step)
 * Requirement ✔
 * - Accepts step value as a parameter
 * - Updates the counter value
 * - DOM update happens inside the function only
 *****************************************************/
const incrementCounter = (step) => {
    counter += step; // updating global variable
    document.getElementById("counterValue").textContent = counter;
};

/*****************************************************
 * Function: resetCounter()
 * Requirement ✔
 * - Resets counter value to 0
 * - DOM update inside function
 *****************************************************/
const resetCounter = () => {
    counter = 0;
    document.getElementById("counterValue").textContent = counter;
};

/*****************************************************
 * Event Listeners
 * Requirement ✔
 * - No inline JavaScript in HTML
 * - UI controlled using JavaScript functions
 *****************************************************/
document.getElementById("incrementBtn").addEventListener("click", () => {
    incrementCounter(1); // passing step value as parameter
});

document.getElementById("resetBtn").addEventListener("click", resetCounter);