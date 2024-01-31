# Personnal website

![status](https://img.shields.io/website?url=https%3A%2F%2Fwww.normalesup.org%2F~dlesbre%2F)
![mirror](https://img.shields.io/website?url=https%3A%2F%2Fwww.eleves.ens.fr%2Fhome%2Fdlesbre%2F&label=mirror)

This repository contains my personnal website.
This website can be found online at [https://www.normalesup.org/~dlesbre/](https://www.normalesup.org/~dlesbre/)
and a mirror version at [https://www.eleves.ens.fr/home/dlesbre](https://www.eleves.ens.fr/home/dlesbre).

## Compiling the website

The website can be build via `make`. Call `make local=true` to link locally and
in debug mode (no file minimization).
Building requires the following dependencies:
- [mlpproc](https://github.com/dlesbre/mlpproc/), a custom preprocessor, to render html/xml files.

  ```console
  pip3 install mlpproc
  ```

- [Sassc](https://github.com/sass/sassc) to render SCSS files

  ```console
  apt install sassc
  ```

- [HTML Tidy](https://www.html-tidy.org/) to verify the output HTML/XML files.
