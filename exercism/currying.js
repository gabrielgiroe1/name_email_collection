// problem 5

function f(a, b) {
  if (b !== undefined) {
    return a + b;
  }

  return function (b) {
    return a + b;
  };
}

console.log(f(1, 5));  // 6
console.log(f(1)(5));  // 6
