# Personnal website

![status](https://img.shields.io/website?url=https%3A%2F%2Fwww.normalesup.org%2F~dlesbre%2F)
![mirror](https://img.shields.io/website?url=https%3A%2F%2Fwww.eleves.ens.fr%2Fhome%2Fdlesbre%2F&label=mirror)

This repository contains my personnal website.
This website can be found online at [https://www.normalesup.org/~dlesbre/](https://www.normalesup.org/~dlesbre/)
and a mirror version at [https://www.eleves.ens.fr/home/dlesbre](https://www.eleves.ens.fr/home/dlesbre).

## Compiling the website

The website is built using `jekyll`. Run `bundle install` to install dependencies
and then `make serve` to create a local version of the website, to which you can
connect at https://localhost:4000/~dlesbre/.

To build and deploy, run `make build`. The website is then available in the `_site` folder.
