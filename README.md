# GBTiles

[![wercker status](https://app.wercker.com/status/c42dc696662599ce8eb787410c3b8780/s "wercker status")](https://app.wercker.com/project/bykey/c42dc696662599ce8eb787410c3b8780) [![Code Climate](https://codeclimate.com/github/bashaus/gbtiles/badges/gpa.svg)](https://codeclimate.com/github/bashaus/gbtiles) [![Test Coverage](https://codeclimate.com/github/bashaus/gbtiles/badges/coverage.svg)](https://codeclimate.com/github/bashaus/gbtiles/coverage)

Converts `.GBR` files created with 
[Harry Mulder's Tile Designer (GBTD)](http://www.devrs.com/gb/hmgd/gbtd.html)
and `.GBM` files created with 
[Harry Mulder's Map Builder (GBMB)](http://www.devrs.com/gb/hmgd/gbmb.html)
to different formats for use with the Game Boy and 
[GBDK](http://gbdk.sourceforge.net/).

**N.B.: Not all of the functionality provided by Harry Mulder's GBR and GBM 
file format specification have been implemented; however there is enough to 
generate the basics for tiles and maps.**

## Installation

    gem install gbtiles

## Usage

### Help

To view help information for the GBR or GBM commands, simply type one of the 
following:

    gbr --help
    gbm --help

### GBR (GBTD files)

Converts a Tile Designer file `*.gbr` to an ASM file `*.s` and generates 
a C file `*.h` for convenience.

    gbr convert --output "sample.s" sample.gbr

### GBM (GBMB files)

Converts a Map Builder file `*.gbm` to an ASM file `*.s` and generates 
a C file `*.h` for convenience.

    gbm convert --output "sample.s" sample.gbm

## Contributors

* @bashaus -- [Bashkim Isai](http://www.bashkim.com.au/)

If you fork this project and create a pull request add your GitHub username, your full name and website to the end of list above.
