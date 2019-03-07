module Data.QuadTree.Test.Region where

import Prelude
import Test.Unit (TestSuite,suite,test)
import Test.Unit.Assert as Assert
import Data.QuadTree.Region (QuadTree(..),depth)

tests:: TestSuite
tests = 
    suite "Region" 
        do depthSuite

trueLeaf :: QuadTree
trueLeaf = Leaf true

quad :: QuadTree
quad = Node trueLeaf trueLeaf trueLeaf trueLeaf

quadOfQuad :: QuadTree
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