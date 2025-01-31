#!/usr/bin/env bash


# dataset: cheminformatics
echo "[35m============================================[0m"
echo "dataset 1/24: [34mcheminformatics (Directed)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool.py dataset/cheminformatics.edgelist "$@" || echo "./profile_graphtool.py dataset/cheminformatics.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph.py dataset/cheminformatics.edgelist "$@" || echo "./profile_igraph.py dataset/cheminformatics.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit.py dataset/cheminformatics.edgelist "$@" || echo "./profile_networkit.py dataset/cheminformatics.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx.py dataset/cheminformatics.edgelist "$@" || echo "./profile_networkx.py dataset/cheminformatics.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap.py dataset/cheminformatics.edgelist "$@" || echo "./profile_snap.py dataset/cheminformatics.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph.py dataset/cheminformatics.edgelist "$@" || echo "./profile_easygraph.py dataset/cheminformatics.edgelist failed" >>profile_entrypoint.log

# dataset: bio
echo "[35m============================================[0m"
echo "dataset 2/24: [34mbio (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/bio.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/bio.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/bio.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/bio.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/bio.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/bio.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/bio.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/bio.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/bio.edgelist "$@" || echo "./profile_snap_undirected.py dataset/bio.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/bio.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/bio.edgelist failed" >>profile_entrypoint.log

# dataset: eco
echo "[35m============================================[0m"
echo "dataset 3/24: [34meco (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/eco.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/eco.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/eco.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/eco.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/eco.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/eco.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/eco.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/eco.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/eco.edgelist "$@" || echo "./profile_snap_undirected.py dataset/eco.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/eco.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/eco.edgelist failed" >>profile_entrypoint.log

# dataset: pgp
echo "[35m============================================[0m"
echo "dataset 4/24: [34mpgp (Directed)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool.py dataset/pgp.edgelist "$@" || echo "./profile_graphtool.py dataset/pgp.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph.py dataset/pgp.edgelist "$@" || echo "./profile_igraph.py dataset/pgp.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit.py dataset/pgp.edgelist "$@" || echo "./profile_networkit.py dataset/pgp.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx.py dataset/pgp.edgelist "$@" || echo "./profile_networkx.py dataset/pgp.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap.py dataset/pgp.edgelist "$@" || echo "./profile_snap.py dataset/pgp.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph.py dataset/pgp.edgelist "$@" || echo "./profile_easygraph.py dataset/pgp.edgelist failed" >>profile_entrypoint.log

# dataset: pgp_undirected
echo "[35m============================================[0m"
echo "dataset 5/24: [34mpgp_undirected (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/pgp_undirected.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/pgp_undirected.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/pgp_undirected.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/pgp_undirected.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/pgp_undirected.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/pgp_undirected.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/pgp_undirected.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/pgp_undirected.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/pgp_undirected.edgelist "$@" || echo "./profile_snap_undirected.py dataset/pgp_undirected.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/pgp_undirected.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/pgp_undirected.edgelist failed" >>profile_entrypoint.log

# dataset: road
echo "[35m============================================[0m"
echo "dataset 6/24: [34mroad (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/road.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/road.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/road.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/road.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/road.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/road.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/road.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/road.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/road.edgelist "$@" || echo "./profile_snap_undirected.py dataset/road.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/road.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/road.edgelist failed" >>profile_entrypoint.log

# dataset: uspowergrid
echo "[35m============================================[0m"
echo "dataset 7/24: [34muspowergrid (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/uspowergrid.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/uspowergrid.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/uspowergrid.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/uspowergrid.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/uspowergrid.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/uspowergrid.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/uspowergrid.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/uspowergrid.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/uspowergrid.edgelist "$@" || echo "./profile_snap_undirected.py dataset/uspowergrid.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/uspowergrid.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/uspowergrid.edgelist failed" >>profile_entrypoint.log

# dataset: enron
echo "[35m============================================[0m"
echo "dataset 8/24: [34menron (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py enron.txt "$@" || echo "./profile_graphtool_undirected.py enron.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py enron.txt "$@" || echo "./profile_igraph_undirected.py enron.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py enron.txt "$@" || echo "./profile_networkit_undirected.py enron.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py enron.txt "$@" || echo "./profile_networkx_undirected.py enron.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py enron.txt "$@" || echo "./profile_snap_undirected.py enron.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py enron.txt "$@" || echo "./profile_easygraph_undirected.py enron.txt failed" >>profile_entrypoint.log

# dataset: amazon
echo "[35m============================================[0m"
echo "dataset 9/24: [34mamazon (Directed)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool.py amazon.txt "$@" || echo "./profile_graphtool.py amazon.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph.py amazon.txt "$@" || echo "./profile_igraph.py amazon.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit.py amazon.txt "$@" || echo "./profile_networkit.py amazon.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx.py amazon.txt "$@" || echo "./profile_networkx.py amazon.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap.py amazon.txt "$@" || echo "./profile_snap.py amazon.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph.py amazon.txt "$@" || echo "./profile_easygraph.py amazon.txt failed" >>profile_entrypoint.log

# dataset: google
echo "[35m============================================[0m"
echo "dataset 10/24: [34mgoogle (Directed)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool.py google.txt "$@" || echo "./profile_graphtool.py google.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph.py google.txt "$@" || echo "./profile_igraph.py google.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit.py google.txt "$@" || echo "./profile_networkit.py google.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx.py google.txt "$@" || echo "./profile_networkx.py google.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap.py google.txt "$@" || echo "./profile_snap.py google.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph.py google.txt "$@" || echo "./profile_easygraph.py google.txt failed" >>profile_entrypoint.log

# dataset: pokec
echo "[35m============================================[0m"
echo "dataset 11/24: [34mpokec (Directed)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool.py pokec.txt "$@" || echo "./profile_graphtool.py pokec.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph.py pokec.txt "$@" || echo "./profile_igraph.py pokec.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit.py pokec.txt "$@" || echo "./profile_networkit.py pokec.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx.py pokec.txt "$@" || echo "./profile_networkx.py pokec.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap.py pokec.txt "$@" || echo "./profile_snap.py pokec.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph.py pokec.txt "$@" || echo "./profile_easygraph.py pokec.txt failed" >>profile_entrypoint.log

# dataset: condmat
echo "[35m============================================[0m"
echo "dataset 12/24: [34mcondmat (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py condmat.txt "$@" || echo "./profile_graphtool_undirected.py condmat.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py condmat.txt "$@" || echo "./profile_igraph_undirected.py condmat.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py condmat.txt "$@" || echo "./profile_networkit_undirected.py condmat.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py condmat.txt "$@" || echo "./profile_networkx_undirected.py condmat.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py condmat.txt "$@" || echo "./profile_snap_undirected.py condmat.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py condmat.txt "$@" || echo "./profile_easygraph_undirected.py condmat.txt failed" >>profile_entrypoint.log

# dataset: wikivote
echo "[35m============================================[0m"
echo "dataset 13/24: [34mwikivote (Directed)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool.py wikivote.txt "$@" || echo "./profile_graphtool.py wikivote.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph.py wikivote.txt "$@" || echo "./profile_igraph.py wikivote.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit.py wikivote.txt "$@" || echo "./profile_networkit.py wikivote.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx.py wikivote.txt "$@" || echo "./profile_networkx.py wikivote.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap.py wikivote.txt "$@" || echo "./profile_snap.py wikivote.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph.py wikivote.txt "$@" || echo "./profile_easygraph.py wikivote.txt failed" >>profile_entrypoint.log

# dataset: facebook
echo "[35m============================================[0m"
echo "dataset 14/24: [34mfacebook (Directed)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool.py facebook.txt "$@" || echo "./profile_graphtool.py facebook.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph.py facebook.txt "$@" || echo "./profile_igraph.py facebook.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit.py facebook.txt "$@" || echo "./profile_networkit.py facebook.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx.py facebook.txt "$@" || echo "./profile_networkx.py facebook.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap.py facebook.txt "$@" || echo "./profile_snap.py facebook.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph.py facebook.txt "$@" || echo "./profile_easygraph.py facebook.txt failed" >>profile_entrypoint.log

# dataset: hepth
echo "[35m============================================[0m"
echo "dataset 15/24: [34mhepth (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py hepth.txt "$@" || echo "./profile_graphtool_undirected.py hepth.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py hepth.txt "$@" || echo "./profile_igraph_undirected.py hepth.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py hepth.txt "$@" || echo "./profile_networkit_undirected.py hepth.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py hepth.txt "$@" || echo "./profile_networkx_undirected.py hepth.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py hepth.txt "$@" || echo "./profile_snap_undirected.py hepth.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py hepth.txt "$@" || echo "./profile_easygraph_undirected.py hepth.txt failed" >>profile_entrypoint.log

# dataset: lastfm
echo "[35m============================================[0m"
echo "dataset 16/24: [34mlastfm (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py lastfm.txt "$@" || echo "./profile_graphtool_undirected.py lastfm.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py lastfm.txt "$@" || echo "./profile_igraph_undirected.py lastfm.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py lastfm.txt "$@" || echo "./profile_networkit_undirected.py lastfm.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py lastfm.txt "$@" || echo "./profile_networkx_undirected.py lastfm.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py lastfm.txt "$@" || echo "./profile_snap_undirected.py lastfm.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py lastfm.txt "$@" || echo "./profile_easygraph_undirected.py lastfm.txt failed" >>profile_entrypoint.log

# dataset: cheminformatics_lcc
echo "[35m============================================[0m"
echo "dataset 17/24: [34mcheminformatics_lcc (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/cheminformatics_lcc.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/cheminformatics_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/cheminformatics_lcc.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/cheminformatics_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/cheminformatics_lcc.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/cheminformatics_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/cheminformatics_lcc.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/cheminformatics_lcc.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/cheminformatics_lcc.edgelist "$@" || echo "./profile_snap_undirected.py dataset/cheminformatics_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/cheminformatics_lcc.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/cheminformatics_lcc.edgelist failed" >>profile_entrypoint.log

# dataset: bio_lcc
echo "[35m============================================[0m"
echo "dataset 18/24: [34mbio_lcc (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/bio_lcc.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/bio_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/bio_lcc.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/bio_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/bio_lcc.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/bio_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/bio_lcc.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/bio_lcc.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/bio_lcc.edgelist "$@" || echo "./profile_snap_undirected.py dataset/bio_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/bio_lcc.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/bio_lcc.edgelist failed" >>profile_entrypoint.log

# dataset: eco_lcc
echo "[35m============================================[0m"
echo "dataset 19/24: [34meco_lcc (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/eco_lcc.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/eco_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/eco_lcc.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/eco_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/eco_lcc.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/eco_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/eco_lcc.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/eco_lcc.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/eco_lcc.edgelist "$@" || echo "./profile_snap_undirected.py dataset/eco_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/eco_lcc.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/eco_lcc.edgelist failed" >>profile_entrypoint.log

# dataset: pgp_lcc
echo "[35m============================================[0m"
echo "dataset 20/24: [34mpgp_lcc (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/pgp_lcc.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/pgp_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/pgp_lcc.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/pgp_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/pgp_lcc.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/pgp_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/pgp_lcc.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/pgp_lcc.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/pgp_lcc.edgelist "$@" || echo "./profile_snap_undirected.py dataset/pgp_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/pgp_lcc.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/pgp_lcc.edgelist failed" >>profile_entrypoint.log

# dataset: pgp_undirected_lcc
echo "[35m============================================[0m"
echo "dataset 21/24: [34mpgp_undirected_lcc (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/pgp_undirected_lcc.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/pgp_undirected_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/pgp_undirected_lcc.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/pgp_undirected_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/pgp_undirected_lcc.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/pgp_undirected_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/pgp_undirected_lcc.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/pgp_undirected_lcc.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/pgp_undirected_lcc.edgelist "$@" || echo "./profile_snap_undirected.py dataset/pgp_undirected_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/pgp_undirected_lcc.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/pgp_undirected_lcc.edgelist failed" >>profile_entrypoint.log

# dataset: road_lcc
echo "[35m============================================[0m"
echo "dataset 22/24: [34mroad_lcc (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/road_lcc.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/road_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/road_lcc.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/road_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/road_lcc.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/road_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/road_lcc.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/road_lcc.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/road_lcc.edgelist "$@" || echo "./profile_snap_undirected.py dataset/road_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/road_lcc.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/road_lcc.edgelist failed" >>profile_entrypoint.log

# dataset: uspowergrid_lcc
echo "[35m============================================[0m"
echo "dataset 23/24: [34muspowergrid_lcc (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py dataset/uspowergrid_lcc.edgelist "$@" || echo "./profile_graphtool_undirected.py dataset/uspowergrid_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py dataset/uspowergrid_lcc.edgelist "$@" || echo "./profile_igraph_undirected.py dataset/uspowergrid_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py dataset/uspowergrid_lcc.edgelist "$@" || echo "./profile_networkit_undirected.py dataset/uspowergrid_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py dataset/uspowergrid_lcc.edgelist "$@" || echo "./profile_networkx_undirected.py dataset/uspowergrid_lcc.edgelist failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py dataset/uspowergrid_lcc.edgelist "$@" || echo "./profile_snap_undirected.py dataset/uspowergrid_lcc.edgelist failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py dataset/uspowergrid_lcc.edgelist "$@" || echo "./profile_easygraph_undirected.py dataset/uspowergrid_lcc.edgelist failed" >>profile_entrypoint.log

# dataset: lastfm_lcc
echo "[35m============================================[0m"
echo "dataset 24/24: [34mlastfm_lcc (Undirected)[0m"
echo "[35m============================================[0m"

echo '[1;4;32mgraphtool[0m igraph networkit networkx [9msnap[0m easygraph'
./profile_graphtool_undirected.py lastfm_lcc.txt "$@" || echo "./profile_graphtool_undirected.py lastfm_lcc.txt failed" >>profile_entrypoint.log
echo 'graphtool [1;4;32migraph[0m networkit networkx [9msnap[0m easygraph'
./profile_igraph_undirected.py lastfm_lcc.txt "$@" || echo "./profile_igraph_undirected.py lastfm_lcc.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph [1;4;32mnetworkit[0m networkx [9msnap[0m easygraph'
./profile_networkit_undirected.py lastfm_lcc.txt "$@" || echo "./profile_networkit_undirected.py lastfm_lcc.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit [1;4;32mnetworkx[0m [9msnap[0m easygraph'
./profile_networkx_undirected.py lastfm_lcc.txt "$@" || echo "./profile_networkx_undirected.py lastfm_lcc.txt failed" >>profile_entrypoint.log
# echo 'graphtool igraph networkit networkx [9msnap[0m easygraph'
# ./profile_snap_undirected.py lastfm_lcc.txt "$@" || echo "./profile_snap_undirected.py lastfm_lcc.txt failed" >>profile_entrypoint.log
echo 'graphtool igraph networkit networkx [9msnap[0m [1;4;32measygraph[0m'
./profile_easygraph_undirected.py lastfm_lcc.txt "$@" || echo "./profile_easygraph_undirected.py lastfm_lcc.txt failed" >>profile_entrypoint.log