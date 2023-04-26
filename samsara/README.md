# Samsara Changes

For security reasons, Samsara's Buildkite agents only support Buildkite plugins that come from the following GitHub orgs: buildkite-plugins, samsara-dev, samsarahq.
This minimizes the risk of a public GitHub project getting access to our source code or being compromised without us knowing.
With that in mind, we had to fork the [monorepo-diff plugin](https://github.com/monebag/monorepo-diff-buildkite-plugin) into the samsara-dev GitHub org.

We had to make some changes to this plugin to allow it to run from another GitHub org.  Specifically, we had to replace the `monebag` string with `samsara-dev` in two places:
1. The `hooks/command` script had a hardcoded path to the `monebag` GitHub repo to download the go binary from a specific release
2. `plugin.go` checks that the go binary is running in the `monebag/monorepo-diff-buildkite-plugin` repo

The `update.sh` script replaces `monebag` with `samsara-dev` everywhere in this repo just to be safe.

## Making a New Release

1. Merge in any new changes (including tags) from [upstream](https://github.com/monebag/monorepo-diff-buildkite-plugin)
2. Run `update.sh` and commit those changes
3. Run `build.sh` to build the plugin's go binary
4. Create a new tag/release and attach the binary to the release
