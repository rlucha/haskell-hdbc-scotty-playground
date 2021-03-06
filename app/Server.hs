{-# LANGUAGE OverloadedStrings #-}

module Server where

import Web.Scotty
import Control.Monad.IO.Class

import Models.Room.Room (getRoom)

getRoomByID :: ActionM()
getRoomByID = do
  id' <- param "id"
  room <- liftIO (getRoom id') -- liftIO to actionM
  json room

routes :: ScottyM ()
routes = get "/room/:id" getRoomByID

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 4888 routes

--
-- module Main where
--
-- import Web.Scotty
-- import Control.Monad.IO.Class
--
-- import Db
--
-- getUserHandler :: ActionM()
-- getUserHandler = do
--   id <- param "id"
--   user <- liftIO (Db.getUser id) -- liftIO to actionM
--   json user
--
-- getAllUsersHandler :: ActionM()
-- getAllUsersHandler = do
--   users <- liftIO Db.getAllUsers -- liftIO to actionM
--   json users
--
-- createRoom :: ActionM()
-- createRoom = do
--   room <- params
--   text (room)
--
-- getFirstParam :: Param -> String
-- getFirstParam param = (head Param)
--
-- routes :: ScottyM ()
-- routes = do
--   get "/users" getAllUsersHandler
--   get "/users/:id" getUserHandler
--   post "/rooms/create" createRoom
--
-- main :: IO ()
-- main = do
--   putStrLn "Starting Server..."
--   scotty 4888 routes
