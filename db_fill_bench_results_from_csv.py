#!/usr/bin/env python3
"""
Author : Xinyuan Chen <45612704+tddschn@users.noreply.github.com>
Date   : 2022-09-25
Purpose: Fill graph info to the sqlite3 db
"""

import argparse
from datetime import datetime
from pathlib import Path
from utils_db import insert_bench_results
from config import bench_results_db_path
import sqlite3, csv


def get_args():
    """Get command-line arguments"""

    parser = argparse.ArgumentParser(
        description='Fill graph info to the sqlite3 db',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument(
        '--db-path',
        metavar='PATH',
        type=Path,
        help='Path to the database',
        default=bench_results_db_path,
    )

    parser.add_argument(
        'csv_path',
        metavar='PATH',
        type=Path,
        help='Path to csv file',
    )

    return parser.parse_args()


def main():
    """Make a jazz noise here"""

    args = get_args()
    csv_path = args.csv_path
    with sqlite3.connect(args.db_path) as conn:
        with csv_path.open() as f:
            reader = csv.DictReader(f)
            for row in reader:
                insert_bench_results(
                    conn,
                    dataset=row.get('dataset', csv_path.stem),
                    method=row['method'],
                    tool=row['tool'],
                    average_time=float(row['avg time']),
                    timestamp=datetime.now(),
                )


if __name__ == '__main__':
    main()
