# 🧮 ZMath

**ZMath** is a lightweight mathematics library written in pure **Haskell**. It provides clean, modular implementations of basic arithmetic, number theory, combinatorics, statistics, and complex number operations.

## 📂 Modules Overview

* **`ZMath`**: Top-level convenience module that re-exports all functions and types from `ZMath.Basic` and `ZMath.Complex`.
* **`ZMath.Basic`**: Core mathematical utilities including summations, factorials, Fibonacci sequences, prime checking, GCD/LCM, permutations, combinations, statistics, and 2D Euclidean distance.
* **`ZMath.Complex`**: Algebraic data types and arithmetic operations for complex numbers ($a + bi$).

---

## 📖 API Reference

### `ZMath.Basic`

| Function / Type | Signature | Description |
| :--- | :--- | :--- |
| `plus` | `[Double] -> Double` | Computes the sum of a list of numbers. |
| `fat'` | `Integer -> Integer` | Calculates the factorial ($n!$) of an integer. |
| `fib` | `Int -> Integer` | Computes the $n$-th Fibonacci number using Binet's closed-form formula. |
| `prime` | `Integer -> Bool` | Checks whether a given integer is a prime number. |
| `mdc` | `Integer -> Integer -> Integer` | Computes the Greatest Common Divisor (GCD) using the Euclidean algorithm. |
| `mmc` | `Integer -> Integer -> Integer` | Computes the Least Common Multiple (LCM) of two integers. |
| `nPr` | `Integer -> Integer -> Integer` | Calculates permutations ($P(n, r)$). |
| `nCr` | `Integer -> Integer -> Integer` | Calculates combinations ($C(n, r)$). |
| `quad` | `Double -> Double -> Double` | Computes the hypotenuse ($\sqrt{a^2 + b^2}$) given two legs. |
| `avar` | `[Double] -> Double` | Calculates the arithmetic mean (average) of a list. |
| `median` | `[Double] -> Double` | Computes the median value of a list of numbers. |
| `Position` | `type Position = (Double, Double)` | Type alias representing a point in a 2D Cartesian plane. |
| `dist` | `Position -> Position -> Double` | Calculates the distance between two 2D points. |

### `ZMath.Complex`

Defines the `Complex` record type:
```haskell
data Complex = Complex
    { real      :: Double
    , imaginary :: Double
    } deriving (Show, Eq)
```

| Function | Signature | Description |
| :--- | :--- | :--- |
| `cSum` | `Complex -> Complex -> Complex` | Adds two complex numbers ($z_1 + z_2$). |
| `cSub` | `Complex -> Complex -> Complex` | Subtracts two complex numbers ($z_1 - z_2$). |
| `cMul` | `Complex -> Complex -> Complex` | Multiplies two complex numbers ($z_1 \cdot z_2$). |
| `cDiv` | `Complex -> Complex -> Complex` | Divides two complex numbers ($z_1 / z_2$). |

---

## 💻 Usage Examples

You can load the top-level module directly into **GHCi** to access everything at once:

```bash
ghci ZMath.hs
```

### Importing the Full Library
```haskell
ghci> import ZMath

-- Basic Math & Combinatorics
ghci> fat' 5
120

ghci> fib 10
55

ghci> nCr 10 3
120

ghci> median [10.0, 2.0, 8.0, 4.0]
6.0

-- Complex Numbers
ghci> let z1 = Complex 3 4
ghci> let z2 = Complex 1 2

ghci> cSum z1 z2
Complex {real = 4.0, imaginary = 6.0}

ghci> cMul z1 z2
Complex {real = -5.0, imaginary = 10.0}
```

*(Alternatively, you can import `ZMath.Basic` or `ZMath.Complex` individually if you only need a specific module.)*

## 🛠️ Built With

* **Haskell** (GHC)
* `Data.List`

## 📄 License

This project is licensed under the **BSD 3-Clause License**. See the [LICENSE](./LICENSE) file for details.
