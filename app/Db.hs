-- {-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE DeriveGeneric #-}
--
-- module Db where
--
-- import GHC.Generics
-- import Database.HDBC
-- import Database.HDBC.Sqlite3
-- import Data.Aeson (FromJSON, ToJSON)
--
-- import Room
--
-- data GameUser = GameUser Integer String String
--   deriving (Show, Generic)
--
-- instance ToJSON GameUser
-- instance FromJSON GameUser
--
-- sqlToGameUser :: [SqlValue] -> GameUser
-- sqlToGameUser row = GameUser (fromSql $ head row) (fromSql $ row!!1) (fromSql $ row!!2)
--
-- getAllUsers :: IO [GameUser]
-- getAllUsers = do
--   -- this path is absolute to the root of the project it seems
--   conn <- connectSqlite3 "db.sql"
--   q <- quickQuery' conn "select * from users" []
--   return (map sqlToGameUser q)
--
-- getUser :: Integer -> IO GameUser
-- getUser id = do
--   conn <- connectSqlite3 "db.sql"
--   q <- quickQuery' conn "select * from users where id = ?" [toSql id]
--   return $ head (map sqlToGameUser q)
