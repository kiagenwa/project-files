function sumPrimes(num) {
  let primes = [2];
  let sum = 0;
  let counter = 1;
  let adder = 1;
  if (num == 1) {
    return sum;
  }
  let calc = primes[counter-1] + adder;
  while (calc <= num) {
    if(primes.some(fig => calc % fig == 0)) {
      adder++;
    } else {
      primes.push(calc);
      counter++;
      adder = 1;
    }
    calc = primes[counter-1] + adder;
  }
  sum = primes.reduce((acc, fig) => acc + fig);
  console.log(primes, sum);
  return sum;
}

sumPrimes(10);