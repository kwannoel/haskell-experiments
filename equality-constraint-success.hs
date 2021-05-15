-- | Reference: https://journal.infinitenegativeutility.com/haskell-type-equality-constraints

{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Main where

class PairOf a b where
    thePair :: (a, b)

instance (Monoid a, a ~ b) => PairOf a b where
  thePair = (mempty, mempty)

obtuseMempty :: Monoid t => t
obtuseMempty = fst thePair

main :: IO ()
main = undefined
