#!/usr/bin/env bash

apps=("cmt" "bmt" "greeter" "tasks-qute")
#apps=("cmt")

for src_name in "${apps[@]}"
do
  src_dir=${PWD}/sample_repos/${src_name}
  outdir=${PWD}/analysis_reports/${src_name}
  mkdir -p "${outdir}"
  echo "Analyzing ${src_name} src: ${src_dir} out: ${outdir}"
  # Ensure we are on the branch PRIOR to migration
  pushd .
  cd "${src_dir}" || exit
  git checkout main
  popd || exit
  time ./bin/kantra analyze -i "${src_dir}" -m source-only -t 'quarkus' -t 'jakarta-ee' -t 'jakarta-ee8+' -t 'jakarta-ee9+' -t 'cloud-readiness' --rules ./custom_rules -o "${outdir}" --overwrite
done

# Check what happens if using custom_rules and not ./custom_rules

