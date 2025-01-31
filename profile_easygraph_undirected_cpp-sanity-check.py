#!/usr/bin/env python3

# disable warnings before importing tensorflow when importing easygraph
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
import warnings
warnings.filterwarnings("ignore")
import easygraph as eg
import easygraph
# from easygraph import *  # type: ignore
from easygraph import Dijkstra, pagerank, strongly_connected_components, read_edgelist, multi_source_dijkstra, k_core, betweenness_centrality, closeness_centrality, connected_components, connected_components_directed, clustering, constraint


from benchmark import benchmark_autorange
from utils_db import profile_script_insert_results
from utils_other import remove_system_resource_limits
import sqlite3
import sys

import argparse

def insert_results():
    try:
        profile_script_insert_results(__file__, filename, avg_times, args.iteration)
    except sqlite3.OperationalError as e:
        print(f"Failed to insert results into database: \n{e}")
        print(f'Please run `./create_bench_results_db.py` to resolve this issue.')

def get_args():
    '''Get command-line arguments'''

    parser = argparse.ArgumentParser(
        description='Benchmark easygraph', formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    parser.add_argument('dataset', help='path to the dataset file in tab-separated edgelist format', metavar='PATH', type=str)
    parser.add_argument(
        '-n',
        '--iteration',
        help='iteration count when benchmarking, auto-determined if unspecified',
        metavar='INT',
        type=int,
    )
    parser.add_argument(
        '--print-graph-info',
        help='get the # of nodes and edges and print',
        action='store_true',
    )
    parser.add_argument(
        '--print-graph-info-only',
        help='get the # of nodes and edges and print, then exit',
        action='store_true',
    )
    return parser.parse_args()


args = get_args()
if args.print_graph_info_only:
    args.print_graph_info = True

remove_system_resource_limits()

filename = args.dataset
n = args.iteration

# filename = sys.argv[1]
# n = int(sys.argv[2])

avg_times: dict[str, float] = {}

print('''\033[91m=================================\033[0m''')
print(f"""Profiling \033[96measygraph\033[0m on dataset \033[34m{filename}\033[0m""")
print('''\033[91m=================================\033[0m''')




# ===========================
print(f"""Profiling \033[92mloading_undirected\033[0m on dataset \033[34m{filename}\033[0m""")
print("=================")
print()


# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then use python version of graph



    

# 'read_edgelist(filename, delimiter="\t", nodetype=int, create_using=eg.Graph())' contains quotes
avg_times |= {'loading_undirected': benchmark_autorange('read_edgelist(filename, delimiter="\t", nodetype=int, create_using=eg.Graph())', globals=globals(), n=n) }

# if tool starts with 'constraint' and

# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then convert g back



# loading* only, make g in the globals() so the methods after loading methods can access it.
    
g_py = eval('read_edgelist(filename, delimiter="\t", nodetype=int, create_using=eg.Graph())')
g = g_py.cpp()
g_cpp = g
    


if args.print_graph_info:
    
    # get the # of nodes and edges and print
    print(f"{g.number_of_nodes()=}, {g.number_of_edges()=}")

    

    if args.print_graph_info_only:
        sys.exit(0)



    
# networkx & easygraph only, after loading*
from utils import get_first_node
nodeid = 'first_node'
first_node = get_first_node(g)
    




# ===========================
print(f"""Profiling \033[92mshortest path\033[0m on dataset \033[34m{filename}\033[0m""")
print("=================")
print()


# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then use python version of graph



    

# f'Dijkstra(g, {nodeid})' contains quotes
avg_times |= {'shortest path': benchmark_autorange(f'Dijkstra(g, {nodeid})', globals=globals(), n=n) }

# if tool starts with 'constraint' and

# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then convert g back






# ===========================
print(f"""Profiling \033[92mbetweenness centrality\033[0m on dataset \033[34m{filename}\033[0m""")
print("=================")
print()


# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then use python version of graph



    

# 'betweenness_centrality(g)' contains quotes
avg_times |= {'betweenness centrality': benchmark_autorange('betweenness_centrality(g)', globals=globals(), n=n) }

# if tool starts with 'constraint' and

# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then convert g back






# ===========================
print(f"""Profiling \033[92mcloseness centrality\033[0m on dataset \033[34m{filename}\033[0m""")
print("=================")
print()


# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then use python version of graph



    

# 'closeness_centrality(g)' contains quotes
avg_times |= {'closeness centrality': benchmark_autorange('closeness_centrality(g)', globals=globals(), n=n) }

# if tool starts with 'constraint' and

# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then convert g back






# ===========================
print(f"""Profiling \033[92mclustering\033[0m on dataset \033[34m{filename}\033[0m""")
print("=================")
print()


# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then use python version of graph



    

# 'clustering(g)' contains quotes
avg_times |= {'clustering': benchmark_autorange('clustering(g)', globals=globals(), n=n) }

# if tool starts with 'constraint' and

# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then convert g back






# ===========================
print(f"""Profiling \033[92mconstraint\033[0m on dataset \033[34m{filename}\033[0m""")
print("=================")
print()


# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then use python version of graph

g = g_py



    

# 'constraint(g)' contains quotes
avg_times |= {'constraint': benchmark_autorange('constraint(g)', globals=globals(), n=n) }

# if tool starts with 'constraint' and

# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then convert g back

g = g_cpp






# ===========================
print(f"""Profiling \033[92mk-core\033[0m on dataset \033[34m{filename}\033[0m""")
print("=================")
print()


# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then use python version of graph



    

# remove self loop from graph g before doing k-core
        

# if tool is easygraph
            
# give eg access to a python version of Graph first, so that removing self loops is possible
# eval code.removesuffix('.cpp()')

g_python = g_py
g = g_python
g.remove_edges(easygraph.selfloop_edges(g))
g = g.cpp()
            

        

    

    



# 'k_core(g)' contains quotes
avg_times |= {'k-core': benchmark_autorange('k_core(g)', globals=globals(), n=n) }

# if tool starts with 'constraint' and

# easygraph constraint doesn't have c bindings
# if method starts with 'constraint', then convert g back







insert_results()