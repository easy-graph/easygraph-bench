from difflib import SequenceMatcher
from pathlib import Path
from itertools import count
import json
from functools import cache
from typing import TYPE_CHECKING, Any, Callable, Iterable, Iterator, TypeVar

# from config import graph_info_json_path
# to avoid circular imports
graph_info_json_path = Path(__file__).parent / 'graph_info.json'

T = TypeVar('T')

if TYPE_CHECKING:
    import networkx as nx


@cache
def get_dataset_list_sorted_by_nodes_and_edges() -> list[str]:
    gi_d = json.loads(graph_info_json_path.read_text())
    return sorted(
        gi_d,
        key=lambda x: (
            x.startswith('er_'),
            gi_d[x]['nodes'],
            gi_d[x]['edges'],
            x.endswith('_directed'),
        ),
    )


def is_dataset_directed(dataset_name: str) -> bool:
    gi_d = json.loads(graph_info_json_path.read_text())
    return gi_d[dataset_name]['is_directed']


def autorange_count_generator(larger_than: int | None = None) -> Iterator[int]:
    base_nums = [1, 2, 5]
    for i in count():
        multiplier = 10**i
        for base_num in base_nums:
            result = base_num * multiplier
            if larger_than is None or result >= larger_than:
                yield result


def get_autorange_count(average_time: float) -> int:  # type: ignore
    if average_time <= 0:
        raise ValueError('average_time must be positive')
    for cnt in autorange_count_generator():
        if average_time * cnt >= 0.2:
            return cnt


def strip_file_content(filename: Path, append: str = '\n') -> None:
    content = Path(filename).read_text()
    Path(filename).write_text(content.strip() + append)


def similar(a: str, b: str) -> float:
    return SequenceMatcher(None, a, b).ratio()


def f7(
    seq: Iterable[T], key: Callable[[T], Any] | None, keep_last: bool = False
) -> Iterable[T]:
    # https://stackoverflow.com/questions/480214/how-do-i-remove-duplicates-from-a-list-while-preserving-order
    seen = set()
    seen_add = seen.add
    if keep_last:
        seq = reversed(seq)  # type: ignore
    if key is None:
        result = iter(x for x in seq if not (x in seen or seen_add(x)))
    else:
        result = iter(x for x in seq if not (key(x) in seen or seen_add(key(x))))
    if keep_last:
        return reversed(list(result))
    return result


def tool_str_to_tool_and_n_workers(tool_str: str) -> tuple[str, str]:
    import re

    tool_str_regex = r"^(?P<tool>.+?)( n_workers=(?P<n_workers>\d+))?$"
    if not (m := re.match(tool_str_regex, tool_str)):
        raise ValueError(f'Invalid tool_str: {tool_str}')
    gd = m.groupdict()
    tool = gd.get('tool', '')
    n_workers = gd.get('n_workers', '')
    return tool, n_workers


def nx_read_edgelist(
    edgelist_path: str,
    directed: bool = False,
    delimiter: str = "\t",
) -> 'nx.Graph | nx.DiGraph':
    import networkx as nx

    g = nx.read_edgelist(
        edgelist_path,
        delimiter=delimiter,
        nodetype=int,
        create_using=nx.DiGraph() if directed else nx.Graph(),
    )
    return g


def get_pretty_graph_name(graph_name: str) -> str:
    return graph_name.rsplit('/', maxsplit=1)[-1].split('.', maxsplit=1)[0]


def get_pretty_tool_name(tool_name: str) -> str:
    return tool_name.split('_', maxsplit=1)[0]


def style_text(text: str, style: str | None = None) -> str:
    # match style:
    #     case 'bold':
    #         return f'\033[1m{text}\033[0m'
    #     case 'underline':
    #         return f'\033[4m{text}\033[0m'
    #     case 'strikethrough':
    #         return f'\033[9m{text}\033[0m'
    #     case _:
    #         raise ValueError(f'Invalid style: {style}')

    if style is None:
        return text
    try:
        from rich.console import Console

        console = Console()
        with console.capture() as c:
            console.print(text, style=style, end='')
        return c.get()
    except ImportError:
        return text
    except:
        return text


def remove_system_resource_limits():
    try:
        import resource

        resource.setrlimit(
            resource.RLIMIT_STACK, (resource.RLIM_INFINITY, resource.RLIM_INFINITY)
        )
        print(f'setrlimit: {resource.getrlimit(resource.RLIMIT_STACK)}')
    except:
        import sys

        sys.setrecursionlimit(5000)
        print(f'setrecursionlimit: {sys.getrecursionlimit()}')
