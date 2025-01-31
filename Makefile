# SHELL := /usr/local/bin/bash
REPOS=tddschn/easygraph-bench easy-graph/easygraph-bench
REPO_SERVER=easy-graph/easygraph-bench
TAGS=server local
TAG_SERVER=server
NOTE_FILE_SERVER=server-release-note.md



sanity-check: gen-scripts
	# ./bench_stub.py -D -p 1 -a -G new
	# ./bench_stub_directed.py -D -p 1 -a -G new
	# ./bench_stub_directed.py -D -p 1
	# ./bench_stub_nx.py -D -p 1
	# ./bench_stub_with_underscore.py -D -p 1
	# ./bench_stub_with_underscore.py -p 1
	# ./bench_pgp.py -D -p 1 -t 10 -G other

gen-scripts:
	./gen_bench_script.py
	./gen_bench_script.py -e
	./gen_bench_script.py -E
	./gen_bench_script.py --entrypoint-bash-er
	./gen_bench_script.py -P
	./gen_bench_script.py -Z
	./gen_bench_script.py -m
	./gen_bench_script.py -M
	./gen_bench_script.py --entrypoint-bash-multiprocessing-paper
	./gen_bench_script.py --entrypoint-bash-paper
	./gen_bench_script.py --er-paper
	./gen_bench_script.py --er-paper --multiprocessing-bench-scripts

gen-easygraph-cpp-sanity-check-scripts:
	./gen_profile_scripts_with_suffix_wrapper.py 'cpp-sanity-check' -e -t 'easygraph' -d 'dataset/cheminformatics.edgelist' 'dataset/bio.edgelist'

gen-scripts-20230427-constraint-clustering:
	./gen_profile_scripts_with_suffix_wrapper.py '20230427-constraint-clustering' \
		-m 'constraint' 'clustering' \
		-t 'igraph' 'easygraph' \
		-D 'google.txt' 'google_lcc.txt' 'pokec.txt' 'pokec_lcc.txt' 'amazon.txt' 'amazon_lcc.txt' 'dataset/pgp.edgelist' 'dataset/pgp_undirected.edgelist'

# gen-scripts-20230403-print-graph-info:
# 	./gen_profile_scripts_with_suffix_wrapper.py '20230403-lastfm-print-graph-info' -t 'igraph' 'easygraph' -d 'lastfm.txt' --profile-entrypoint-bash-arg "\-\-print-graph-info-only"

gen-scripts-20230403-print-graph-info:
	./gen_profile_scripts_with_suffix_wrapper.py '20230403-lastfm' -t 'igraph' 'easygraph' -d 'lastfm.txt' 'lastfm_lcc.txt'
	./profile_entrypoint_20230403-lastfm.sh --print-graph-info-only

gen-scripts-20230403:
	./gen_profile_scripts_with_suffix_wrapper.py '20230403-lastfm' -t 'igraph' 'easygraph' -d 'lastfm.txt' 'lastfm_lcc.txt'

gen-scripts-20230331:
	./gen_profile_scripts_with_suffix_wrapper.py '20230331-all-without-google-pokec' -t 'igraph' 'easygraph' -D 'google.txt' 'google_lcc.txt' 'pokec.txt' 'pokec_lcc.txt'

gen-scripts-20230330:
	./gen_profile_scripts_with_suffix_wrapper.py '20230330-hepth-fb-fix' -t 'igraph' 'easygraph' -d 'facebook.txt' 'facebook_lcc.txt' 'hepth.txt' 'hepth_lcc.txt'

gen-scripts-20230329-directed-only:
	./gen_profile_scripts_with_suffix_wrapper.py '20230329-scc-directed-only' --tools 'igraph' 'easygraph' --methods 'page rank' 'strongly connected components' --directed-datasets-only

gen-scripts-20230328-directed-only:
	./gen_profile_scripts_with_suffix_wrapper.py '20230328-pagerank-scc-directed-only' --tools 'igraph' 'easygraph' --methods 'page rank' 'strongly connected components' --directed-datasets-only

gen-scripts-20230327:
	./gen_profile_scripts_with_suffix_wrapper.py '20230327-kcore' --tools 'igraph' 'easygraph' --methods 'k-core'

gen-scripts-20230324:
	./gen_profile_scripts_with_suffix_wrapper.py '20230324-centrality-dijkstra' --tools 'igraph' 'easygraph' --methods 'betweenness centrality' 'closeness centrality' 'shortest path' -d 'dataset/road_lcc.edgelist' 'enron_lcc.txt' 'google_lcc.txt' 'amazon_lcc.txt' 'pokec_lcc.txt'

gen-scripts-20230322:
	./gen_profile_scripts_with_suffix_wrapper.py '20230322-centrality' --tools 'igraph' 'easygraph' --methods 'betweenness centrality' 'closeness centrality'

gen-scripts-20230323:
	./gen_bench_script.py --profile --profile-suffix '20230323-kcore-centrality' --profile-select-tools 'igraph' 'easygraph' --profile-select-methods 'betweenness centrality' 'closeness centrality' 'k-core'
	./gen_bench_script.py --profile-entrypoint --profile-suffix '20230323-kcore-centrality' --profile-select-tools 'igraph' 'easygraph' --profile-select-methods 'betweenness centrality' 'closeness centrality' 'k-core'

release-dbs:
	$(foreach REPO,$(REPOS), \
		$(foreach TAG,$(TAGS), \
			gh --repo $(REPO) release upload $(TAG) bench-results-$(TAG).db --clobber; \
		) \
	)

edit-server-release-note:
	$(foreach REPO,$(REPOS), \
		gh --repo $(REPO) release edit $(TAG_SERVER) -F $(NOTE_FILE_SERVER); \
	)

make-server-release-latest:
	$(foreach REPO,$(REPOS), \
		gh --repo $(REPO) release edit $(TAG_SERVER) --latest; \
	)


init-server-releases:
	$(foreach TAG,$(TAGS), \
		gh --repo $(REPO_SERVER) release create $(TAG) --generate-notes; \
	)


deta:
	deta deploy ../easygraph-bench-results-fastapi

evaluate: clean
	./bench.py

clean: clean-outputs clean-figs

clean-outputs:
	rm *.{json,csv}

clean-figs:
	rm -rf images/

zip-csv:
	zip -r bench-results-csv.zip *.csv

zip-figs:
	zip -r bench-result-figures.zip images

bench-all:
	parallel gh workflow run bench.yaml -f uploadResultsAsArtifact="false" -f benchScriptSet={} ::: 'stub' 'stub-fast' 'normal' 'large' 'coauthorship'
	# gh workflow run bench.yaml -f uploadResultsAsArtifact="false" -f benchScriptSet=stub-fast
	# gh workflow run bench.yaml -f uploadResultsAsArtifact="false" -f benchScriptSet=stub
	# gh workflow run bench.yaml -f uploadResultsAsArtifact="false" -f benchScriptSet=normal
	# gh workflow run bench.yaml -f uploadResultsAsArtifact="false" -f benchScriptSet=large
	# gh workflow run bench.yaml -f uploadResultsAsArtifact="false" -f benchScriptSet=coauthorship

patch-p: patch install publish push
minor-p: minor install publish push
major-p: major install publish push

install:
	poetry install

publish:
	poetry publish --build

patch:
	bump2version patch

minor:
	bump2version minor

major:
	bump2version major

push:
	git push origin master

# yapf:
# 	poetry run yapf -i -vv **/*.py

.PHONY: *