#!/bin/sh
/usr/local/nginx/sbin/nginx
echo 'alias exit="echo Are you sure? this will kill the container. use Ctrl + p, Ctrl + q to detach or ctrl + d to exit"' > ~/.bashrc
bash
