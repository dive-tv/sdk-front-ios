    #!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "touchvie/sdk-front-ios" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then

  echo -e "START...\n"
  cd SDKFrontiOS
  VERSION=$(agvtool what-marketing-version -terse | grep SDKFrontiOS/Info.plist | sed 's/.*\=//')
  echo "VERSION: " $VERSION

  location="docs/"
  location+=$VERSION
  echo "LOCATION: " $location

  # Get to the Travis build directory, configure git and clone the repo
  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "travis-ci"

  echo -e "\nCloning gh-pages..."
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/$TRAVIS_REPO_SLUG gh-pages > /dev/null

  if [ -d $location ]; then
    #do nothing
    echo -e "\nVersion name already exists"
  else
    #updating doc

    echo -e "\nInstalling jazzy..."
    gem install jazzy

    echo -e "\nCreating documentation..."
    cd $HOME/build/$TRAVIS_REPO_SLUG/SDKFrontiOS
    pwd
    jazzy --min-acl private

    cp -R docs $HOME/javadoc-latest

    #create doc and update the index
    echo -e "\nNew Version -> " $VERSION

    cd $HOME/gh-pages
    mkdir -p $location
    echo -e "\nFolder created: " $location

    cd docs

    #create listing index
    echo -e "\nCreating Index.html"
    ls | sort -nr | egrep -v ".html" | perl -e 'print "<html><body><h1>Version Docs Listing</h1><ul><li><a href=\"'$VERSION'\">Latest ('$VERSION')</a></li><hr>"; while(<>) { chop $_; print "<li><a href=\"./$_\">$_</a></li>";} print "</ul></body></html>"' > index.html

    cp -Rf $HOME/javadoc-latest/. $VERSION
    git add -f .
    git commit -m "Lastest doc on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
    commit_message="Release $RELEASE_VERSION doc pushed to gh-pages."

    # Set tag
    git tag -a $VERSION -m "Version "$VERSION

    echo -e "\nPushing..."
    git push -fq origin gh-pages --tags > /dev/null

    echo -e "Published doc to gh-pages.\n"
  fi

else
  echo -e "Not publishing doc.\n"
fi