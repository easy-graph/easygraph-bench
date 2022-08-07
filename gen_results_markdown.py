#!/usr/bin/env python3

from itertools import takewhile
from jinja2 import FileSystemLoader, Environment
from pathlib import Path

marker = '<!-- the markdown code below this line is auto generated by `./gen_results_markdown.py` -->'


from config import (
    eg_master_dir,
    load_functions_name,
    di_load_functions_name,
    clustering_methods,
    shortest_path_methods,
    # connected_components_methods,
    connected_components_methods_G,
    connected_components_methods_G_node,
    mst_methods,
    method_groups,
    dataset_names,
)

e = Environment(loader=FileSystemLoader('templates'))
# Load the Jinja2 template.
template = e.get_template('result_template.md')
methods_list = [
    clustering_methods,
    shortest_path_methods,
    # connected_components_methods,
    connected_components_methods_G,
    connected_components_methods_G_node,
    mst_methods,
]
method_name_list = []
for l in methods_list:
    for method_name in l:
        if isinstance(method_name, tuple):
            method_name_list.append(method_name[0])
        else:
            method_name_list.append(method_name)

datasets = {
    'cheminformatics': 'ENZYMES_g1: nodes: 37 edges: 84',
    'bio': 'bio-yeast: nodes: 1458 edges: 1948',
    'eco': 'econ-mahindas: nodes: 1258 edges: 7619',
}
# data = {'method_name': 'Dijkstra', 'dataset_name': 'bio'}
# rendered = template.render(data)
# print(rendered)

output = []

for dataset_path, dataset_display_name in datasets.items():
    output.append('')
    output.append(f'#### {dataset_path}')
    output.append('')
    output.append(f'{dataset_display_name}')
    output.append('')
    for method in method_name_list:
        rendered = template.render(
            method_name=method,
            dataset_name=dataset_path,
        )
        output.append(rendered)
        output.append('')

readme = Path('README.md')
readme_lines_orig = readme.read_text().splitlines()
readme_lines = list(takewhile(lambda line: marker not in line, readme_lines_orig))
readme_lines.extend(output)

readme.write_text('\n'.join(readme_lines))