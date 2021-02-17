import Test.QuickCheck

main :: IO ()
main = do
    quickCheck propMyAppend
    quickCheck propMyNull

-- Append two lists
myAppend :: [a] -> [a] -> [a]
myAppend [] [] = []
myAppend (x:xs) [] = x:xs
myAppend [] (y:ys) = y:ys
myAppend (x:xs) (y:ys) = x: myAppend xs (y:ys)


--Extract last item from a finite List
myLast :: [a] -> a
myLast [] = error "empty list, no last item"
myLast [x] = x
myLast (x:xs) = myLast xs


--test whether a list is empty
myNull :: (Eq a) => [a] -> Bool
myNull x = x == []


--test myAppend
propMyAppend :: [Int] -> [Int] -> Bool
propMyAppend xs ys = xs ++ ys == myAppend xs ys


--test myLast
--propMyLast :: [Int] -> Bool
--propMyLast xs = myLast xs == last xs


--test myNull
propMyNull :: [Int] -> Bool
propMyNull xs = null xs == myNull xs