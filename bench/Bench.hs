{-# LANGUAGE DataKinds #-}

module Main where

import Data.List
import Data.Maybe
import Data.Time.Clock

import qualified Data.Mod
import qualified Data.Mod.Word
import qualified Data.Modular
import qualified Numeric.Modular

benchAddition :: IO ()
benchAddition = do
  putStrLn "Addition"

  t0 <- getCurrentTime
  print (sum [1..10^7] :: Data.Mod.Word.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Mod.Word"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (sum [1..10^7] :: Data.Mod.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Mod"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (sum [1..10^7] :: Data.Modular.Mod Integer 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Modular"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (sum (map fromIntegral [1..10^7]) :: Numeric.Modular.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Numeric.Modular"
  print $ diffUTCTime t1 t0

benchProduct :: IO ()
benchProduct = do
  putStrLn "Product"

  t0 <- getCurrentTime
  print (product [1..10^7] :: Data.Mod.Word.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Mod.Word"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (product [1..10^7] :: Data.Mod.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Mod"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (product [1..10^7] :: Data.Modular.Mod Integer 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Modular"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (product (map fromIntegral [1..10^7]) :: Numeric.Modular.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Numeric.Modular"
  print $ diffUTCTime t1 t0

benchInversion :: IO ()
benchInversion = do
  putStrLn "Inversion"

  t0 <- getCurrentTime
  print (sum (map (fromJust . Data.Mod.Word.invertMod) [1 ..10^6]) :: Data.Mod.Word.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Mod.Word"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (sum (map (fromJust . Data.Mod.invertMod) [1 ..10^6]) :: Data.Mod.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Mod"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (sum (map Data.Modular.inv [1..10^6]) :: Data.Modular.Mod Integer 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Modular"
  print $ diffUTCTime t1 t0

benchPower :: IO ()
benchPower = do
  putStrLn "Power"

  t0 <- getCurrentTime
  print (sum (map (2 ^) [1..10^6]) :: Data.Mod.Word.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Mod.Word"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (sum (map (2 ^) [1..10^6]) :: Data.Mod.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Mod"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (sum (map (2 ^) [1..10^6]) :: Data.Modular.Mod Integer 1000000007)
  t1 <- getCurrentTime
  putStrLn "Data.Modular"
  print $ diffUTCTime t1 t0

  t0 <- getCurrentTime
  print (sum (map (2 ^) [1..10^6]) :: Numeric.Modular.Mod 1000000007)
  t1 <- getCurrentTime
  putStrLn "Numeric.Modular"
  print $ diffUTCTime t1 t0

main :: IO ()
main = do
  benchAddition
  benchProduct
  benchInversion
  benchPower
