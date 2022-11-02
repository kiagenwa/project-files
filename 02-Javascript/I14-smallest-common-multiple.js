function smallestCommons(arr) {
  const [min, max] = arr.slice().sort((a,b) => a-b);
  let numba = Array(max-min+1).fill(0).map((_,i) => i+min);
  //Euclidean algorithm
  const gcd = (a, b) => (b===0) ? a : gcd(b, a%b);
  const lcm = (a, b) => (a * b) / gcd(a,b);
  return numba.reduce((total, num) => lcm(total, num));
}

smallestCommons([1,5]);