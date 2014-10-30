
# VALHEN website

This website is built using Middleman.

## Setup

Setting up a development environment is easy.

```
sudo apt-get install libmagickwand-dev # required rmagick gem.
git clone git@github.com:kfprimm/valhen
cd valhen
bundle             # install all the gems
rake data:pull     # grab local copy of pictures
rake pictures:all  # process all the pictures
```

Then, launch the server:

```
middleman server
```

## Authors

 - Tony Incitti (@ajincitti)
 - Matt Harris (@sonic331va)
 - Kevin Primm (@kfprimm)
