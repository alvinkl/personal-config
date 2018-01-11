function trunctablePrimes() {
    const isPrime = num => {
        for (let i = 2; i <= Math.sqrt(num); i++)
            if (num % i == 0) return false

        return true;
    }

    let res = [];
    for (let i = 2; i < 100; i++)
        if (isPrime(i)) res.push(i)

    return res;
}

console.log(trunctablePrimes())
