import json
import sqlite3
from datetime import datetime
from pathlib import Path
from typing import Iterable

from config import (
    bench_results_db_path,
    bench_results_table_name,
    dataset_homepage_mapping,
    graph_info_json_path,
    graph_info_table_name,
    graph_property_to_excel_field_mapping,
    methods6_timlrx,
    methods_timlrx,
)
from utils_other import get_autorange_count

python_type_to_sqlite_type = {
    int: 'INTEGER',
    float: 'REAL',
    str: 'TEXT',
    bool: 'INTEGER',
    # datetime: 'TEXT',
    datetime: 'date',
}


def get_graph_info_field_types() -> dict[str, str]:
    gi_d = json.loads(graph_info_json_path.read_text())
    _, properties = gi_d.popitem()
    graph_property_types = {'dataset': str, 'homepage': str}
    graph_property_types |= {
        property_name: type(value) for property_name, value in properties.items()
    }
    return {
        property_name: python_type_to_sqlite_type[property_type]
        for property_name, property_type in graph_property_types.items()
    }


def get_graph_property_to_excel_field_mapping() -> dict[str, str]:
    d = {}
    for property in get_graph_info_field_types():
        if property not in graph_property_to_excel_field_mapping:
            d[property] = property.replace('_', ' ')
        else:
            d[property] = graph_property_to_excel_field_mapping[property]
    return d


def get_bench_results_field_types() -> dict[str, str]:
    return {
        'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'dataset': 'TEXT',
        'method': 'TEXT',
        'tool': 'TEXT',
        'average_time': 'REAL',
        'iteration_count': 'INTEGER',
        'timestamp': 'TEXT',
        'multiprocessing': 'BOOLEAN DEFAULT 0',
        'n_workers': 'INTEGER DEFAULT 1',
    }


csv_field_name_to_db_field_name_mapping = {
    'avg time': 'average_time',
    'iteration count': 'iteration_count',
}


def insert_bench_results(
    conn: sqlite3.Connection,
    dataset: str,
    method: str,
    tool: str,
    average_time: float,
    timestamp: datetime,
    iteration_count: int | None = None,
    multiprocessing: bool = False,
    n_workers: int = 1,
):
    conn.set_trace_callback(print)
    c = conn.cursor()
    if iteration_count is None:
        try:
            iteration_count = get_autorange_count(average_time)
        except ValueError:
            iteration_count = 0
    if n_workers > 1:
        multiprocessing = True
    c.execute(
        f'INSERT INTO {bench_results_table_name} (dataset, method, tool, average_time, iteration_count, timestamp, multiprocessing, n_workers) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        (
            dataset,
            method,
            tool,
            average_time,
            iteration_count,
            timestamp,
            multiprocessing,
            n_workers,
        ),
    )
    conn.commit()


def insert_graph_info(conn: sqlite3.Connection, graph_info_dict: dict[str, dict]):
    conn.set_trace_callback(print)
    c = conn.cursor()
    for dataset, properties in graph_info_dict.items():
        c.execute(
            f'INSERT INTO {graph_info_table_name} (dataset, homepage, {", ".join(properties.keys())}) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            (dataset, dataset_homepage_mapping.get(dataset), *properties.values()),
        )
    conn.commit()


def init_db(conn: sqlite3.Connection):
    conn.set_trace_callback(print)
    cursor = conn.cursor()
    #     """CREATE TABLE IF NOT EXISTS "bench-results"(
    # "dataset" TEXT PRIMARY KEY NOT NULL, "method" TEXT, "tool" TEXT, "avg time" TEXT,
    #  "iteration count" TEXT);
    #     """
    graph_info_field_str = ', '.join(
        f'"{field_name}" {field_type}{"" if field_name != "dataset" else " PRIMARY KEY NOT NULL"}'
        for field_name, field_type in get_graph_info_field_types().items()
    )
    bench_results_field_str = ', '.join(
        f'"{field_name}" {field_type} NOT NULL'
        for field_name, field_type in get_bench_results_field_types().items()
    )
    graph_info_table_creation_sql = (
        f'CREATE TABLE IF NOT EXISTS "{graph_info_table_name}"({graph_info_field_str});'
    )
    bench_results_table_creation_sql = f'CREATE TABLE IF NOT EXISTS "{bench_results_table_name}"({bench_results_field_str}, FOREIGN KEY("dataset") REFERENCES {graph_info_table_name}("dataset"));'
    cursor.execute(graph_info_table_creation_sql)
    cursor.execute(bench_results_table_creation_sql)


def profile_script_insert_results(
    script: str,
    dataset_filename: str,
    avg_times: dict[str, float],
    iteration_count: int | None = None,
    write_csv: bool = True,
    csv_file: Path = Path(__file__).parent / 'profile_results.csv',
) -> None:
    now = datetime.now()
    if write_csv:
        import csv

        with open(csv_file, 'a') as f:
            writer = csv.writer(f)
            # write header if file is empty
            if csv_file.stat().st_size == 0:
                writer.writerow(list(get_bench_results_field_types())[1:])
            for method, avg_time in avg_times.items():
                writer.writerow(
                    [
                        Path(dataset_filename).stem,
                        method if method != 'loading_undirected' else 'loading',
                        Path(script)
                        .stem.removesuffix('_profile')
                        .removeprefix('profile_')
                        .removesuffix('_undirected'),
                        avg_time,
                        now,
                        iteration_count,
                    ]
                )

    with sqlite3.connect(bench_results_db_path) as conn:
        # num_method = len(avg_times)
        # if num_method == 6:
        #     methods = methods6_timlrx
        # else:
        #     methods = methods_timlrx
        # for i, avg_time in enumerate(avg_times):
        for method, avg_time in avg_times.items():
            insert_bench_results(
                conn,
                dataset=Path(dataset_filename).stem,
                method=method if method != 'loading_undirected' else 'loading',
                tool=Path(script)
                .stem.removesuffix('_profile')
                .removeprefix('profile_')
                .removesuffix('_undirected'),
                average_time=avg_time,
                timestamp=now,
                iteration_count=iteration_count,
            )
