#!/bin/bash

# If no arg given, show instruction and quit
if [ -z $1 ]
then
	echo "usage: $0 project_name"
	exit 1
fi

# If the arg given, create project or if already exists, show detail and quit
if [ ! -d $1 ]
then
	echo "Create new project $1"
	mkdir -p $1
else
	echo "project $1 already exists"
	exit 1
fi

# Go in the project
cd $1

touch __init__.py # Create empty files
echo "# $1 project" > README.md # Create files & first line

# Create template for README.md
cat << OEF > README.md
# $1 project

**Contibutors: __name__

## Getting Started

(Write here)

### Prerequisites

(Write here)

### Installing

(Write here)

### Working

(Write here)

## Built With

* [tool](website) - Description of the tool.

OEF

# Create directories
dirs="config data lib prefs scripts startup tmp users utilities widgets"

# Create a .gitignore file in each folder to allow to use git
for dir in $dirs
do
	mkdir $dir
	touch $dir/.gitignore
done

# edit .gitignore in data & tmp directories
touch startup/__init__.py
echo "*" > data/.gitignore
echo "*" > tmp/.gitignore