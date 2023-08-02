#!/usr/bin/env bash

set -e

declare -a names

for config in ci-configs/*; do
  names+=("$(basename "$config" .config)")
done
echo "Found ${#names[@]} configurations"

for name in "${names[@]}"; do
  echo "Building $name"
  cabal build --allow-newer --ghc-options -Werror --project-file "ci-configs/$name.config" --builddir "dist-$name"
done

echo "Updating .cabal file"

declare -a plans
for name in "${names[@]}"; do
  plans+=("dist-$name/cache/plan.json")
done

cabal-plan-bounds "${plans[@]}" -c cabal-force-upper-bound.cabal
