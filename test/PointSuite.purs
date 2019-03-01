module QuadTree.Test.Point where

import Prelude
import Test.Unit(TestSuite,suite,test)
import Test.Unit.Assert as Assert
import Data.QuadTree.Point (PointQuadTree(..),depth)

pointSuite:: TestSuite
pointSuite = 
    suite "Point" 
        do depthSuite

trueLeaf :: PointQuadTree
trueLeaf = Leaf true

quad :: PointQuadTree
quad = Node trueLeaf trueLeaf trueLeaf trueLeaf

quadOfQuad :: PointQuadTree
quadOfQuad = Node trueLeaf trueLeaf trueLeaf quad

depthSuite :: TestSuite
depthSuite = 
    suite "Depth" do
        test "leaf" do
            Assert.equal 1 (depth trueLeaf)
        test "quad" do
            Assert.equal 2 (depth quad)
        test "quadOfQuad" do
            Assert.equal 3 (depth quadOfQuad)