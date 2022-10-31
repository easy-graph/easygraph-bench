#!/usr/bin/env bash

./bench_cheminformatics.py "$@"
./bench_bio.py "$@"
./bench_eco.py "$@"
./bench_pgp.py "$@"
./bench_pgp_undirected.py "$@"
./bench_road.py "$@"
./bench_uspowergrid.py "$@"
./bench_enron.py "$@"
./bench_coauthorship.py "$@"
./bench_er_500.py "$@"
./bench_er_1000.py "$@"
./bench_er_5000.py "$@"
./bench_er_10000.py "$@"