module Main where

-- | We want type families to construct a data structure
-- This is used to store information with respect to instances.
-- It allows specify which instances get chosen,
-- avoiding the issue of overlapping instances.
-- The approach we adopt here is use type families to construct an ordering of instances.
-- Then we can generate a constraint set that is deterministic.
