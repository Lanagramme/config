#! /bin/bash
ssh-keygen -C lborromee16@gmail.com
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
