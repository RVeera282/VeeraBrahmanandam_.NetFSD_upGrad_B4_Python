// ES6 module export
export let tasks = []; 
// Using let because the array content changes

/* 1️ CALLBACK-BASED ASYNC STORAGE (BASE VERSION) */
// Simulates async storage using setTimeout
const asyncStorageCallback = (callback) => {
  setTimeout(() => {
    callback(tasks);
  }, 500);
};

/* 2️ PROMISE-BASED VERSION (REFACTORING STEP) */

const asyncStoragePromise = () => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(tasks);
    }, 500);
  });
};

/* 3️ ASYNC / AWAIT VERSION (FINAL & MODERN) */
// Add task using async/await
export const addTaskAsync = async (task) => {
  // Arrow function + async
  tasks.push(task);
  await asyncStoragePromise(); // simulating async save
};

// Delete task using async/await
export const deleteTaskAsync = async (index) => {
  tasks.splice(index, 1);
  await asyncStoragePromise();
};

// List tasks using async/await
export const listTasksAsync = async () => {
  const storedTasks = await asyncStoragePromise();
  return storedTasks;
};