#!/bin/sh

if [ $# -eq 1 ]
	then
	cp _posts/_-_-_-post-template.md _posts/$(date +'%Y-%m-%d')-$1.md
	echo "_posts/$(date +'%Y-%m-%d')-$1.md created"
	else
	echo "post url hiphen title required"
fi
