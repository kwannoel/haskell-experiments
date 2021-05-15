-- | Reference: https://journal.infinitenegativeutility.com/haskell-type-equality-constraints

{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Main where

class PairOf a b where
    thePair :: (a, b)

instance Monoid a => PairOf a a where
  thePair = (mempty, mempty)

obtuseMempty :: Monoid t => t
obtuseMempty = fst thePair
-- ^ Why does this fail?
-- Error message:
-- Cannot deduce (PairOf a b0) from the use of "thePair"
-- from the context: Monoid t => t
-- The type variable b0 is ambiguous.
--
-- What GHC is telling us:
-- "a" can be unified to "t", since it is the return type from (fst thePair).
-- "b0" was never used, since we did not evaluate it: e.g. (snd thePair)
-- So we don't know what type it is, i.e. "ambiguous"
--
-- What we expected:
-- We used "thePair", with (Monoid t) constraint
-- Monoid t should match the instance constraint.
-- So we should have Monoid t => PairOf t t
-- And we should get what we expect.
--
-- What actually happens:
-- GHC will first match the instance declaration:
-- PairOf a a
-- Only when that is matched,
-- It will try to satisfy constraints:
-- Monoid a
--
-- first step is to concretize "thePair"'s type.
-- thePair :: (a, b0)
-- where a is bound: forall a. Monoid a => a
-- b0 is ambiguous, we don't know the type.
--
-- Next, we try to unify:
-- Pair a a ~ Pair a b0
-- This fails, because at this point there is no assertion
-- that a ~ b0.
--
-- What we need to do instead is to defer this check.
-- see `success` for the example.

main :: IO ()
main = undefined
