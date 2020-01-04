#!/usr/bin/env zsh

# count the number of SLOC in a github repo
git clone --depth 1 "$1" temp-linecount-repo &&
	printf "(temp-linecount-repo will be deleted)\n\n\n" &&
	cloc temp-linecount-repo &&
	rm -rf temp-linecount-repo

