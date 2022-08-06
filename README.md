# easygraph-bench

Benchmarking code that compares the performance of the 2 graph libraries [easygraph](https://github.com/easy-graph/Easy-Graph) (python & C++ binding) and [networkx](https://networkx.org).


- [easygraph-bench](#easygraph-bench)
  - [Benchmarking method](#benchmarking-method)
  - [Benchmarked methods](#benchmarked-methods)
  - [Run locally](#run-locally)
    - [Scripts usage](#scripts-usage)
  - [Result visualization](#result-visualization)
  - [Datasets](#datasets)
  - [Results](#results)
    - [Complete results](#complete-results)
      - [cheminformatics](#cheminformatics)
      - [bio](#bio)
      - [eco](#eco)
  - [Useful links](#useful-links)

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
- connected_components_methods: `[ "is_connected", "number_connected_components", "connected_components", ("connected_component_of_node", 'node_connected_component'), ]`
- mst_methods: `['minimum_spanning_tree']`

## Run locally

`python >= 3.9` is required.

- [./bench.py](./bench.py):  
   Deprecated, modified and parameterized from [@coreturn](https://github.com/coreturn)'s benchmarking script.  
   Only run the methods once with and record the difference of the result of `time.time()` calls as the time spent.  
   Use the following scripts instead.
- [./bench_cheminfo.py](./bench_cheminfo.py): Run benchmarks on the cheminfomatics dataset
- [./bench_bio.py](./bench_bio.py): Run benchmarks on the bio dataset
- [./bench_eco.py](./bench_eco.py): Run benchmarks on the eco dataset
- [./bench_soc.py](./bench_soc.py): Run benchmarks on the soc dataset

To run these scripts, you need to clone the repo and install the dependencies listed in requirements.txt.

As of 8/6/2022, wheel for `python-easygraph` is not available on PyPI, and you need to build it yourself and install the module.

For macOS users, you may try the following snippet to do that:

```bash
git clone https://github.com/easy-graph/Easy-Graph && cd Easy-Graph
brew install boost boost-python

[ -d 'build'] && rm -rf build/

# modify line below based on your machine configuration, don't copy and run verbatim!
# you may also need to install clang or clang++ if you haven't already.
python3 setup.py build_ext -l boost_python39 -L "/usr/local/Cellar/boost-python3/1.79.0/lib" -I "/usr/local/Cellar/boost/1.79.0/include"

python3 setup.py install
```

### Scripts usage

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

## Result visualization

`timeit` results are saved in json files, and `seaborn` is used to render and save the figures in the `images/` directory.

<!-- The figures look like this:
![](images-public/cheminfomatics/average_clustering.png) -->

See [Complete results](#complete-results).


## Datasets

See [dataset_loaders.py](./dataset_loaders.py) and [dataset](./dataset/).


## Results

- Machine: MacBookPro16,2 (Mid-2020 MacBook Pro, Intel i7-1068NG7 (8) @ 2.30GHz, 16GB RAM)
- OS: macOS Monterey 12.5 21G72 x86_64
- python: Python 3.9.10 | packaged by conda-forge | (main, Feb  1 2022, 21:28:27)
scripts ran that generated the results: `./bench_*.py`.


### Complete results

Click on the triangles to see the results.  
The images may take sometime to load.

<!-- the markdown code below this line is auto generated by `./gen_results_markdown.py` -->

#### cheminformatics

ENZYMES_g1: nodes: 37 edges: 84

- <details>
  <summary>average_clustering</summary>
  
  ![](./images-public/cheminformatics/average_clustering.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>clustering</summary>
  
  ![](./images-public/cheminformatics/clustering.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>Dijkstra</summary>
  
  ![](./images-public/cheminformatics/Dijkstra.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>is_biconnected</summary>
  
  ![](./images-public/cheminformatics/is_biconnected.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>biconnected_components</summary>
  
  ![](./images-public/cheminformatics/biconnected_components.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>minimum_spanning_tree</summary>
  
  ![](./images-public/cheminformatics/minimum_spanning_tree.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>


#### bio

bio-yeast: nodes: 1458 edges: 1948

- <details>
  <summary>average_clustering</summary>
  
  ![](./images-public/bio/average_clustering.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>clustering</summary>
  
  ![](./images-public/bio/clustering.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>Dijkstra</summary>
  
  ![](./images-public/bio/Dijkstra.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>is_biconnected</summary>
  
  ![](./images-public/bio/is_biconnected.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>biconnected_components</summary>
  
  ![](./images-public/bio/biconnected_components.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>minimum_spanning_tree</summary>
  
  ![](./images-public/bio/minimum_spanning_tree.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>


#### eco

econ-mahindas: nodes: 1258 edges: 7619

- <details>
  <summary>average_clustering</summary>
  
  ![](./images-public/eco/average_clustering.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>clustering</summary>
  
  ![](./images-public/eco/clustering.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>Dijkstra</summary>
  
  ![](./images-public/eco/Dijkstra.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>is_biconnected</summary>
  
  ![](./images-public/eco/is_biconnected.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>biconnected_components</summary>
  
  ![](./images-public/eco/biconnected_components.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

- <details>
  <summary>minimum_spanning_tree</summary>
  
  ![](./images-public/eco/minimum_spanning_tree.png)
  <!-- ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets -->
<!-- Two important rules:

Make sure you have an empty line after the closing </summary> tag, otherwise the markdown/code blocks won't show correctly.
Make sure you have an empty line after the closing </details> tag if you have multiple collapsible sections. -->
</details>

## Useful links

- [EasyGraph](https://github.com/easy-graph/Easy-Graph)
- [NetworkX](https://networkx.org)
- [networkx-easygraph-comparison](https://github.com/tddschn/networkx-easygraph-comparison)
    My opinionated comparison of the 2 projects

