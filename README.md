# easygraph-bench

[![Benchmark using all datasets](https://github.com/tddschn/easygraph-bench/actions/workflows/bench-all.yaml/badge.svg)](https://github.com/tddschn/easygraph-bench/actions/workflows/bench-all.yaml)

Benchmarking code that compares the performance of the 2 graph libraries [easygraph](https://github.com/easy-graph/Easy-Graph) (python & C++ binding) and [networkx](https://networkx.org).


- [easygraph-bench](#easygraph-bench)
  - [Benchmarking method](#benchmarking-method)
  - [Benchmarked methods](#benchmarked-methods)
  - [Run](#run)
    - [Run locally](#run-locally)
      - [Scripts usage](#scripts-usage)
      - [Run on a custom dataset](#run-on-a-custom-dataset)
    - [Run on GitHub Actions](#run-on-github-actions)
  - [Result visualization](#result-visualization)
  - [Datasets](#datasets)
  - [FAQ](#faq)
    - [Why do you repeat yourself by using `bench_*.py` scripts?](#why-do-you-repeat-yourself-by-using-bench_py-scripts)
  - [Results](#results)
    - [Results downloads](#results-downloads)

## Benchmarking method

[timeit.Timer.autorange](https://docs.python.org/3.10/library/timeit.html#timeit.Timer.autorange) is used to run the specified methods on the graph objects.

If the method returns a Generator, the result will be exhausted.

See [get_Timer_args()](https://github.com/tddschn/easygraph-bench/blob/69cc89889e39386f495b7fa07be3116443cc9356/utils.py#L191) for more details.
 
## Benchmarked methods

See [config.py](./config.py) for more details.

- clustering_methods: `["average_clustering", "clustering"]`  
    (`eg.average_clustering` vs `nx.average_clustering`, ...)
- shortest_path_methods: `[('Dijkstra', 'single_source_dijkstra_path')]`  
    (`eg.Dijkstra` vs `nx.single_source_dijkstra_path`)
<!-- - connected_components_methods: `[ "is_connected", "number_connected_components", "connected_components", ("connected_component_of_node", 'node_connected_component'), ]` -->
- connected_components_methods: `["is_biconnected", "biconnected_components"]`
- mst_methods: `['minimum_spanning_tree']`  
    C++ binding not supported for this method yet.

## Run

### Run locally

`python >= 3.9` is required.

You can run benchmarking on a single dataset with the `./bench_*.py` scripts,  
or run benchmarking on a set of datasets with the `./entrypoint_*.py` scripts.

<!-- - Run benchmarks on a single dataset  
    You can choose what method category to benchmark via `-G`. See [Scripts usage](#scripts-usage).
    - [./bench_cheminformatics.py](./bench_cheminformatics.py): Run benchmarks on the cheminfomatics dataset
    - [./bench_bio.py](./bench_bio.py): Run benchmarks on the bio dataset
    - [./bench_eco.py](./bench_eco.py): Run benchmarks on the eco dataset
    - [./bench_soc.py](./bench_soc.py): Run benchmarks on the soc dataset (WIP)
- Run benchmarks on all datasets  
    - [./bench.py](./bench.py): Run benchmarks on all datasets  
        You can choose what method category to benchmark via `-G`. See [Scripts usage](#scripts-usage).
- Deprecated  
    - [./archive/bench.py](./archive/bench.py):  
    Deprecated, modified and parameterized from [@coreturn](https://github.com/coreturn)'s benchmarking script.  
    Only run the methods once with and record the difference of the result of `time.time()` calls as the time spent.  
    Use the following scripts instead. -->

To run these scripts, you need to clone the repo and install the dependencies listed in requirements.txt.

As of 8/6/2022, wheel for `python-easygraph` is not available on PyPI, and you need to build it yourself and install the module.

For macOS users, you may try the following snippet to do that:

```bash
git clone https://github.com/easy-graph/Easy-Graph && cd Easy-Graph
brew install boost --build-from-source
brew install boost-python

[ -d 'build'] && rm -rf build/

# modify line below based on your machine configuration, don't copy and run verbatim!
# you may also need to install clang or clang++ if you haven't already.
python3 setup.py build_ext -l boost_python310 -L "/usr/local/Cellar/boost-python3/1.79.0/lib" -I "/usr/local/Cellar/boost/1.79.0/include"

python3 setup.py install
```

#### Scripts usage

```
$ ./bench_cheminfo.py --help

ENZYMES_g1: nodes: 37 edges: 84
usage: bench_cheminfo.py [-h] [-G {clustering,shortest-path,connected-components,mst} [{clustering,shortest-path,connected-components,mst} ...]] [-C]

EasyGraph & NetworkX side-by-side benchmarking

optional arguments:
  -h, --help            show this help message and exit
  -G {clustering,shortest-path,connected-components,mst} [{clustering,shortest-path,connected-components,mst} ...], --method-group {clustering,shortest-path,connected-components,mst} [{clustering,shortest-path,connected-components,mst} ...]
  -C, --skip-cpp-easygraph, --skip-ceg
                        Skip benchmarking cpp_easygraph methods (default: False)
```

#### Run on a custom dataset

See [./bench_cheminfo.py](./bench_cheminfo.py).

Modify the dataset loading function `load_cheminformatics` to load your own dataset.

### Run on GitHub Actions

Fork this repo, go to the Actions tab and click Run Workflow.

## Result visualization

`timeit` results are saved in json files, and `seaborn` is used to render and save the figures in the `images/` directory.

<!-- The figures look like this:
![](images-public/cheminfomatics/average_clustering.png) -->

See [Complete results](#complete-results).


## Datasets

See [dataset_loaders.py](./dataset_loaders.py) and [dataset](./dataset/) for details.

| Dataset Name                                                                                            | nodes   | edges    | type                             | is_directed |
| ------------------------------------------------------------------------------------------------------- | ------- | -------- | -------------------------------- | ----------- |
| [cheminformatics](https://networkrepository.com/ENZYMES-g1.php)                                         | 37      | 84       | easygraph.classes.graph.Graph    | False       |
| [eco](https://networkrepository.com/econ-mahindas.php)                                                  | 1258    | 7619     | easygraph.classes.graph.Graph    | False       |
| [bio](https://networkrepository.com/bio-yeast.php)                                                      | 1458    | 1948     | easygraph.classes.graph.Graph    | False       |
| [enron](https://snap.stanford.edu/data/email-Enron.html)                                                | 36692   | 367662   | networkx.classes.digraph.DiGraph | True        |
| [pgp](https://github.com/tddschn/easygraph-bench/blob/master/dataset/pgp/pgp.xml)                       | 39796   | 301498   | networkx.classes.digraph.DiGraph | True        |
| [pgp_undirected](https://github.com/tddschn/easygraph-bench/blob/master/dataset/pgp/pgp_undirected.xml) | 39796   | 197150   | networkx.classes.graph.Graph     | False       |
| [road](https://networkrepository.com/road-usa.php)                                                      | 129164  | 165435   | easygraph.classes.graph.Graph    | False       |
| [amazon](https://snap.stanford.edu/data/amazon0302.html)                                                | 262111  | 1234877  | networkx.classes.digraph.DiGraph | True        |
| [coauthorship](https://github.com/chenyang03/co-authorship-network)                                     | 402392  | 1234019  | networkx.classes.graph.Graph     | False       |
| [google](https://snap.stanford.edu/data/web-Google.html)                                                | 875713  | 5105039  | networkx.classes.digraph.DiGraph | True        |
| [pokec](https://snap.stanford.edu/data/soc-Pokec.html)                                                  | 1632803 | 30622564 | networkx.classes.digraph.DiGraph | True        |



## FAQ

### Why do you repeat yourself by using `bench_*.py` scripts?

Yeah, I know this is not DRY. But for the `timeit`-based benchmarking code to work,
`eg`, `nx` and the graph objects must be in the global scope, i.e. `__main__`. 

I don't know how to do that while sticking to the DRY principle. 

But if you know, please tell me. :)

## Results

<!-- - Machine: MacBookPro16,2 (Mid-2020 MacBook Pro, Intel i7-1068NG7 (8) @ 2.30GHz, 16GB RAM)
- OS: macOS Monterey 12.5 21G72 x86_64
- python: Python 3.10.5 | packaged by conda-forge | (main, Jun 14 2022, 07:03:09) [Clang 13.0.1 ] on darwin -->

The benchmarking were run on Ubuntu 20.04 with GitHub Actions on [GitHub-hosted runners](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#cloud-hosts-used-by-github-hosted-runners) with CPython 3.10.


Results were generated by running `./bench.py`. See also [bench.yaml](./.github/workflows/bench.yaml).

### Results downloads

You can download the benchmarking results on the [Releases](https://github.com/tddschn/easygraph-bench/releases) page.

<!-- ### Complete results

Click on the triangles to see the results.  
The images may take sometime to load.

`avg_time == -1` means method not supported by graph type (`NetworkXNotImplemented` or `EasyGraphNotImplemented` exceptions thrown).

`avg_time == -10` means that the benchmarking of this method was timed out. -->

<!-- the markdown code below this line is auto generated by `./gen_results_markdown.py` -->


