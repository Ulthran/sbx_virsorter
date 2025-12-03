<img src="https://github.com/sunbeam-labs/sunbeam/blob/main/docs/images/sunbeam_logo.gif" width=120, height=120 align="left" />

# sbx_virsorter

<!-- Badges start -->
[![Tests](https://github.com/Ulthran/sbx_virsorter/actions/workflows/tests.yml/badge.svg)](https://github.com/Ulthran/sbx_virsorter/actions/workflows/tests.yml)
![Condabot](https://img.shields.io/badge/condabot-active-purple)
[![DockerHub](https://img.shields.io/docker/pulls/sunbeamlabs/sbx_virsorter)](https://hub.docker.com/repository/docker/sunbeamlabs/sbx_virsorter/)
<!-- Badges end -->

## Introduction

sbx_virsorter is a [sunbeam](https://github.com/sunbeam-labs/sunbeam) extension for detecting diverse DNA and RNA virus genomes. This pipeline uses [VirSorter2](https://github.com/jiarong/VirSorter2).

NOTE: sbx_virsorter requires sbx_assembly to be installed to perform the assembly that goes into VirSorter2.

## Database

VirSorter2 requires a local copy of a database to run. Access instructions for download here: https://github.com/jiarong/VirSorter2/tree/master?tab=readme-ov-file#download-database-and-dependencies

## Config

  - virsorter_db: Path to virsorter database (e.g. /path/to/virsorter_db/ver2/)
    
## Docs

More [docs](https://sunbeam.readthedocs.io/en/stable/extensions.html).