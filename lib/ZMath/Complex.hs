module ZMath.Complex(
    cSum,
    cSub,
    cDiv,
    cMul,
    Complex(..)
) where

data Complex = Complex
    {   real :: Double
    ,   imaginary :: Double
    } deriving (Show, Eq)
cSum :: Complex -> Complex -> Complex
cSum z1 z2 = 
    Complex
        (real z1 + real z2)
        (imaginary z1 + imaginary z2)
cSub :: Complex -> Complex -> Complex
cSub z1 z2 =
    Complex
        (real z1 - real z2)
        (imaginary z1 - imaginary z2)
cDiv :: Complex -> Complex -> Complex
cDiv z1 z2 = z3
    where
        den = real z2 ^ 2 + imaginary z2 ^ 2
        r = (real z1 * real z2 + imaginary z1 * imaginary z2) / den
        i = (real z1 * real z2 - imaginary z1 * imaginary z2) / den
        z3 = Complex r i
cMul :: Complex -> Complex -> Complex
cMul z1 z2 =
    Complex
        (real z1 * real z2 - imaginary z1 * imaginary z2)
        (real z1 * imaginary z2 + imaginary z1 * real z2)

