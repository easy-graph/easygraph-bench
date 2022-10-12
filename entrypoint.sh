#!/usr/bin/env bash

./bench_cheminformatics.py $@
./bench_bio.py $@
./bench_eco.py $@
./bench_pgp.py $@
./bench_pgp_undirected.py $@
./bench_road.py $@
./bench_uspowergrid.py $@
./bench_enron.py $@
./bench_google.py $@
./bench_amazon.py $@
./bench_coauthorship.py $@
./bench_stub.py $@
./bench_stub_with_underscore.py $@
./bench_stub_directed.py $@
./bench_stub_nx.py $@