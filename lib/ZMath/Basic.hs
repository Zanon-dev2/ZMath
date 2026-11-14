module ZMath.Basic (
    plus,
    fat',
    fib,
    prime,
    mdc,
    mmc,
    nPr,
    nCr,
    quad,
    avar,
    Position(..),
    dist,
    median
) where

import Data.List (sort)

plus :: [Double] -> Double
plus nums = do
    let s = length nums
    nsu nums s 0
    where
        nsu :: [Double] -> Int -> Int -> Double
        nsu n s i
            | i >= s = 0
            | otherwise = (n !! i) + nsu n s (i+1)

fat' :: Integer -> Integer
fat' n
    | n > 1 = n * fat' (n-1)
    | otherwise = 1

fib :: Int -> Integer
fib term = round ((f ** n - (1 - f) ** n) / sqrt 5.0)
    where
        f = (1+sqrt 5.0)/2
        n = fromIntegral term

prime :: Integer -> Bool
prime num =
    if num > 2
        then    div' num (num-1)
        else False
    where
        div' :: Integer -> Integer -> Bool
        div' n d
            | d == 1 = True
            | n `mod` d == 0 = False
            | otherwise = div' n (d-1)

mdc :: Integer -> Integer -> Integer
mdc na nb
    | na > nb = mc na nb (-1)
    | otherwise = mc nb na (-1)
    where
        mc :: Integer -> Integer -> Integer -> Integer
        mc nc nd res
            | res == (-1) = mc nc nd (nc `mod` nd)
            | nd `mod` res == 0 = res
            | otherwise = mc nc nd (nd `mod` res)

mmc :: Integer -> Integer -> Integer
mmc na nb = (m `div` mndc)
    where
        m = abs (na * nb)
        mndc = mdc na nb

nPr :: Integer -> Integer -> Integer
nPr na nb = (fa `div` fk)
    where
        fa = fat' na
        fk = fat' (na - nb)

nCr :: Integer -> Integer -> Integer
nCr n p = num `div` b
    where
        num = fat' n
        b = (fat' p * fat' (n - p))

quad :: Double -> Double -> Double
quad a b = c
    where
        c = (sqrt(a**2 + b**2))

avar :: [Double] -> Double
avar n = do
    let s = fromIntegral (length n)
    let m = plus n
    m / s

median :: [Double] -> Double
median [] = error "Empty"
median ns
    | odd n = sorted !! mid
    | otherwise = (sorted !! (mid - 1) + sorted !! mid) / 2.0
    where
        sorted = sort ns
        n = length ns
        mid = n `div` 2

type Position = (Double, Double)
dist :: Position -> Position -> Double
dist x y = sqrt(dx + dy)
    where
        dx = ((fst x - snd x) ^^ 2)
        dy = ((fst y - snd y) ^^ 2)