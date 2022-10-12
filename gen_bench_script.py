#!/usr/bin/env python3
"""
Author : Xinyuan Chen <45612704+tddschn@users.noreply.github.com>
Date   : 2022-08-21
Purpose: generate bench scripts from jinja template
"""

import argparse
from io import StringIO
from jinja2 import FileSystemLoader, Environment, Template
from pathlib import Path
from config import dataset_names, bench_scripts_set
from stat import S_IEXEC

ENTRYPOINT_SH_PATH = Path(__file__).parent / 'entrypoint.sh'


def gen_bench_script(dataset_name: str, template: Template) -> str:
    load_func_name = f'load_{dataset_name}'
    return template.render(load_func_name=load_func_name)


def gen_bench_script_entrypoint(script_set: str, template: Template) -> str:
    script_set_list = f'{script_set}'
    return template.render(script_set_list=script_set_list)


def gen_bench_script_entrypoint_bash(
    datasets: list[str], bash_arg: str, template: Template
) -> str:
    script_body = '\n'.join(f'./bench_{d}.py {bash_arg}' for d in datasets)
    return template.render(script_body=script_body)


def get_args():
    """Get command-line arguments"""

    parser = argparse.ArgumentParser(
        description='generate bench scripts from jinja template',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument(
        '-d',
        '--dataset',
        type=str,
        choices=dataset_names,
        nargs='+',
        default=dataset_names,
    )

    parser.add_argument(
        '-e',
        '--entrypoint',
        help='generate entry point scripts instead of individual ones',
        action='store_true',
    )

    parser.add_argument(
        '-E',
        '--entrypoint-bash',
        help='generate entry point scripts in bash',
        action='store_true',
    )

    parser.add_argument(
        '--bash-arg', help='command line args for entrypoint.sh', type=str, default='$@'
    )

    parser.add_argument('-o', '--output', type=Path, help='output file')

    return parser.parse_args()


def main():
    """Make a jazz noise here"""
    args = get_args()
    e = Environment(loader=FileSystemLoader('templates'))
    # Load the Jinja2 template.
    template = e.get_template('bench_template.jinja.py')
    template_entrypoint = e.get_template('entrypoint.jinja.py')
    template_entrypoint_bash = e.get_template('entrypoint.jinja.sh')
    if args.entrypoint:
        for script_set in bench_scripts_set:
            script_content = gen_bench_script_entrypoint(
                script_set, template=template_entrypoint
            )
            script_set_name = script_set.removeprefix('bench_scripts_')
            output_path = Path(f'entrypoint_{script_set_name}.py')
            output_path.write_text(script_content)
            output_path.chmod(output_path.stat().st_mode | S_IEXEC)
            print(
                f'Benchmark entrypoint script for {script_set_name} generated at {output_path}'
            )
        return

    if args.entrypoint_bash:
        script_content = gen_bench_script_entrypoint_bash(
            datasets=args.dataset,
            bash_arg=args.bash_arg,
            template=template_entrypoint_bash,
        )
        ENTRYPOINT_SH_PATH.write_text(script_content)
        ENTRYPOINT_SH_PATH.chmod(ENTRYPOINT_SH_PATH.stat().st_mode | S_IEXEC)
        print(f'Benchmark entrypoint shell script generated at {ENTRYPOINT_SH_PATH}')
        return

    if args.output is not None and len(args.dataset) == 1:
        dataset_name = args.dataset[0]
        script_content = gen_bench_script(dataset_name, template=template)
        output_path = args.output
        output_path.write_text(script_content)
        output_path.chmod(output_path.stat().st_mode | S_IEXEC)
        print(f'Benchmark script for {dataset_name} is generated at {output_path}')
    else:
        # ignores -o if dataset > 1
        for dataset_name in args.dataset:
            script_content = gen_bench_script(dataset_name, template=template)
            output_path = Path(f'bench_{dataset_name}.py')
            output_path.write_text(script_content)
            output_path.chmod(output_path.stat().st_mode | S_IEXEC)
            print(f'Benchmark script for {dataset_name} is generated at {output_path}')


if __name__ == '__main__':
    main()
