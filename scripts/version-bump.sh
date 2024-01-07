#!/bin/bash

# Get the current version from pom.xml
current_version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

# Break the version number into an array using '.' as delimiter
IFS='.' read -r -a version_parts <<< "$current_version"

# Increment the patch version
patch_version=$((version_parts[2]++))

# Construct the new version string
new_version="${version_parts[0]}.${version_parts[1]}.${version_parts[2]}-SNAPSHOT"

# Set the new version in the pom.xml
mvn versions:set -DnewVersion=$new_version

# Commit the updated pom.xml file
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git commit -am "Bump version to $new_version"
git push

# If you want to also tag this commit, uncomment the following lines:
# git tag -a "v$new_version" -m "Bump version to $new_version"
# git push origin "v$new_version"
