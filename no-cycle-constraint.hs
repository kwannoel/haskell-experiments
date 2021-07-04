-- Adapted from: https://stackoverflow.com/questions/42053915/unexpected-overlapping-instances-error

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

import Data.Kind (Constraint)

-- Typelevel Function to get the parent class(es)
-- This is open family, we need to extend it with instances.
-- Extending done whenever we have a new subtyping relation.
-- This provides a persistent type level tree we can traverse.
-- We only need to provide supertype,
-- since coercion is from subtype to supertype (specific -> general)
type family SuperType (c :: Type) :: (p :: Type)

type instance SuperType Char ::
type instance SuperType Int :: Rational
type instance SuperType t :: Void

type family HasParent (c :: Type) (p :: Type) :: Bool where
    child `HasParent` parent = Elem parent (SuperClass c)


class ((<:) child parent) where
    cast :: child -> parent

instance ()

main :: IO ()
main = undefined
