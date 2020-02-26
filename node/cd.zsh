function load-node-version {
  if [[ -f .node-version ]]; then
    echo "Auto switching node version to $(cat .node-version) using n"
    n $(cat .node-version)
  fi
  # TODO: Merge with above...
  if [[ -f .nvmrc ]]; then
    echo "Auto switching node version to $(cat .nvmrc) using n"
    n $(cat .nvmrc)
  fi
}

function cd {
  builtin cd "$@"
  load-node-version
}
