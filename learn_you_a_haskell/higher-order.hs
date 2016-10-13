import qualified Data.Set as Set
import qualified Data.Map as Map
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _          = []
zipWith' _ _  []         = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where g x y = f y x

sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0
