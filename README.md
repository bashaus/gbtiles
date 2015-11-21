# GBTiles

[![Build Status](https://travis-ci.org/bashaus/gbtiles.svg?branch=master)](https://travis-ci.org/bashaus/gbtiles)
[![Code Climate](https://codeclimate.com/github/bashaus/gbtiles/badges/gpa.svg)](https://codeclimate.com/github/bashaus/gbtiles)
[![Test Coverage](https://codeclimate.com/github/bashaus/gbtiles/badges/coverage.svg)](https://codeclimate.com/github/bashaus/gbtiles/coverage)

Converts `.GBR` files created with 
[Harry Mulder's Tile Designer (GBTD)](http://www.devrs.com/gb/hmgd/gbtd.html)
and `.GBM` files created with 
[Harry Mulder's Map Builder (GBMB)](http://www.devrs.com/gb/hmgd/gbmb.html)
to different formats for use with the Game Boy and 
[GBDK](http://gbdk.sourceforge.net/).

<small>N.B.: Not all of the functionality provided by Harry Mulder's GBR and GBM 
file format specification have been implemented; however there is enough to 
generate the basics for tiles and maps.</small>

Also converts `.MOD` tracker files setup for the Game Boy for use with 
[AntonioND's GBT Player](https://github.com/AntonioND/gbt-player).



## Installation

Install globally:

    gem install gbtiles

Include in your `Gemfile`:

    gem "gbtiles", "~> 0.2.0"



## Usage

To view help information for each of the commands, simply type one of the 
following:

    # Converts .GBM files to different formats for the Game Boy
    gbm convert --help
    
    # Converts .GBR files to different formats for the Game Boy
    gbr convert --help

    # Converts .MOD files to different formats for the Game Boy
    gbt convert --help
