{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE UndecidableSuperClasses #-}
{-# LANGUAGE PolyKinds #-}

module Main where

import Data.Kind
import GHC.TypeLits

-- | We represent supertype relation as a function from a subtype to a list of supertypes.
-- Relations should be DAG, be this is not enforced, although it will be flagged.
type family Supertype (t1 :: Type) :: [(t2 :: Type)]

-- | To determine a subtype relation, we perform a transitive lookup
-- This maps to a constraint
-- TODO: detect cycles
type family  (t1 :: Type) :: (t2 :: Type) where


main :: IO ()
main = undefined
