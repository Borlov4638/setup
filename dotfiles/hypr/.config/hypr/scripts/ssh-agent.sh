#!/bin/bash

eval $(ssh-agent -s)
for file in $(ls ~/.ssh | grep -E -v '.pub|known_hosts'); do
  ssh-add ~/.ssh/$file
done
