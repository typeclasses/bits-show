module Bits.Show where

import Data.Bits
import GHC.Exts

class FixedWidthIntegral

{- |
Examples:

@showFiniteBits (5 :: Int8) = "00000101"@

@showFiniteBits ((-5) :: Int8) = "11111011"@
-}
showFiniteBits :: (FiniteBits bits, IsString string) => bits -> string
showFiniteBits x =
  fromString
    (
      fmap (showBit . testBit x)
        (takeWhile (>= 0)
          (
            iterate
              (\i -> i - 1)
              (finiteBitSize x - 1)
          )
        )
    )

{- | @{ True -> '1'; False -> '0' }@ -}
showBit :: Bool -> Char
showBit x = case x of
    True -> '1'
    False -> '0'
