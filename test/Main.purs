module Test.Main where

import Prelude
import Effect (Effect)
import Test.Unit.Main (runTest)
import Data.QuadTree.Test.Region as Region

main :: Effect Unit
main = 
  runTest do
    Region.tests