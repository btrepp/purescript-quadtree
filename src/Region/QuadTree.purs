module Data.QuadTree.Region where

import Data.Maybe(Maybe)
import Control.MonadZero (empty)
import Prelude

-- | A Quad Tree that deals with points (or pixels)
-- | This structure cannot be corrupted
-- | https://en.wikipedia.org/wiki/Quadtree#Region_quadtree
data QuadTree = 
    Node QuadTree QuadTree QuadTree QuadTree
    | Leaf Boolean

-- | Returns true if the element is a leaf
isLeaf :: QuadTree -> Boolean
isLeaf (Leaf _) = true
isLeaf _ = false

-- | Returns true if the element is a node
isNode :: QuadTree -> Boolean
isNode (Node _ _ _ _) = true
isNode _ = false

-- | Obtains the value if the element is a leaf
_leaf :: QuadTree -> Maybe Boolean
_leaf (Leaf b) = pure b
_leaf _ = empty

_fst :: QuadTree -> Maybe QuadTree
_fst (Node a _ _ _ ) = pure a
_fst _ = empty

_snd :: QuadTree -> Maybe QuadTree
_snd (Node _ a _ _) = pure a
_snd _ = empty

_thrd :: QuadTree -> Maybe QuadTree
_thrd (Node _ _ a _) = pure a
_thrd _ = empty

_forth :: QuadTree -> Maybe QuadTree
_forth (Node _ _ _ a) = pure a
_forth _ = empty

-- | Calculates the depth of the quad tree
-- | Note this point quad tree represents something
-- | Completly square
depth :: QuadTree -> Int
depth node = 
    depth' node 0
    where
        depth' :: QuadTree -> Int -> Int
        depth' (Leaf _ ) acc = acc+1
        depth' (Node a b c d) acc = 
            let a' = depth' a (acc+1)
                b' = depth' b (acc+1)
                c' = depth' c (acc+1)
                d' = depth' d (acc+1)
            in max (max a' b') (max c' d')           
    