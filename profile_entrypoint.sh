#!/usr/bin/env bash


# dataset: cheminformatics

./profile_graphtool.py dataset/cheminformatics.edgelist "$@"
./profile_igraph.py dataset/cheminformatics.edgelist "$@"
./profile_networkit.py dataset/cheminformatics.edgelist "$@"
./profile_networkx.py dataset/cheminformatics.edgelist "$@"
# ./profile_snap.py dataset/cheminformatics.edgelist "$@"
./profile_easygraph.py dataset/cheminformatics.edgelist "$@"

# dataset: bio

./profile_graphtool_undirected.py dataset/bio.edgelist "$@"
./profile_igraph_undirected.py dataset/bio.edgelist "$@"
./profile_networkit_undirected.py dataset/bio.edgelist "$@"
./profile_networkx_undirected.py dataset/bio.edgelist "$@"
# ./profile_snap_undirected.py dataset/bio.edgelist "$@"
./profile_easygraph_undirected.py dataset/bio.edgelist "$@"

# dataset: eco

./profile_graphtool_undirected.py dataset/eco.edgelist "$@"
./profile_igraph_undirected.py dataset/eco.edgelist "$@"
./profile_networkit_undirected.py dataset/eco.edgelist "$@"
./profile_networkx_undirected.py dataset/eco.edgelist "$@"
# ./profile_snap_undirected.py dataset/eco.edgelist "$@"
./profile_easygraph_undirected.py dataset/eco.edgelist "$@"

# dataset: pgp

./profile_graphtool.py dataset/pgp.edgelist "$@"
./profile_igraph.py dataset/pgp.edgelist "$@"
./profile_networkit.py dataset/pgp.edgelist "$@"
./profile_networkx.py dataset/pgp.edgelist "$@"
# ./profile_snap.py dataset/pgp.edgelist "$@"
./profile_easygraph.py dataset/pgp.edgelist "$@"

# dataset: pgp_undirected

./profile_graphtool_undirected.py dataset/pgp_undirected.edgelist "$@"
./profile_igraph_undirected.py dataset/pgp_undirected.edgelist "$@"
./profile_networkit_undirected.py dataset/pgp_undirected.edgelist "$@"
./profile_networkx_undirected.py dataset/pgp_undirected.edgelist "$@"
# ./profile_snap_undirected.py dataset/pgp_undirected.edgelist "$@"
./profile_easygraph_undirected.py dataset/pgp_undirected.edgelist "$@"

# dataset: road

./profile_graphtool_undirected.py dataset/road.edgelist "$@"
./profile_igraph_undirected.py dataset/road.edgelist "$@"
./profile_networkit_undirected.py dataset/road.edgelist "$@"
./profile_networkx_undirected.py dataset/road.edgelist "$@"
# ./profile_snap_undirected.py dataset/road.edgelist "$@"
./profile_easygraph_undirected.py dataset/road.edgelist "$@"

# dataset: uspowergrid

./profile_graphtool_undirected.py dataset/uspowergrid.edgelist "$@"
./profile_igraph_undirected.py dataset/uspowergrid.edgelist "$@"
./profile_networkit_undirected.py dataset/uspowergrid.edgelist "$@"
./profile_networkx_undirected.py dataset/uspowergrid.edgelist "$@"
# ./profile_snap_undirected.py dataset/uspowergrid.edgelist "$@"
./profile_easygraph_undirected.py dataset/uspowergrid.edgelist "$@"

# dataset: enron

./profile_graphtool_undirected.py enron.txt "$@"
./profile_igraph_undirected.py enron.txt "$@"
./profile_networkit_undirected.py enron.txt "$@"
./profile_networkx_undirected.py enron.txt "$@"
# ./profile_snap_undirected.py enron.txt "$@"
./profile_easygraph_undirected.py enron.txt "$@"

# dataset: amazon

./profile_graphtool.py amazon.txt "$@"
./profile_igraph.py amazon.txt "$@"
./profile_networkit.py amazon.txt "$@"
./profile_networkx.py amazon.txt "$@"
# ./profile_snap.py amazon.txt "$@"
./profile_easygraph.py amazon.txt "$@"