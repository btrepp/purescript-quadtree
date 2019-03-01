module Test.Main where

import Prelude
import Effect (Effect)
import Test.Unit.Main (runTest)
import QuadTree.Test.Point (pointSuite)

main :: Effect Unit
main = 
  runTest do
    pointSuite