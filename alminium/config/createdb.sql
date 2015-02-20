CREATE DATABASE IF NOT EXISTS alminium DEFAULT CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON alminium.* TO alminium@localhost IDENTIFIED BY 'alminium';
GRANT ALL PRIVILEGES ON alminium.* TO alminium@"192.%" IDENTIFIED BY 'alminium';
GRANT ALL PRIVILEGES ON alminium.* TO alminium@"172.%" IDENTIFIED BY 'alminium';
