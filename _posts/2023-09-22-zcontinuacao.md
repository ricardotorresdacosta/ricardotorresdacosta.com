
# **Day 8-10** 
[(Back to plan)](#30-day-plan-to-learn-helm)

**Goal**: Learn how to use Helm templates. Understand Helm functions and pipelines. Explore Helm dependencies and managing multiple charts.


## Helm Templates

When Helm installs a release, it goes over the following steps:
1. Load the chart, including dependencies
1. Parse the values
1. Exectue the temoplates, generating YAML
1. Parse the YAML into K8s objects to verifiy the data
1. Send it to K8s

The `--dry-run` command gos over the first four steps, dumps the K8s manifests on the CLI and stops there. Nothing is sent to K8s nor release records are added.

## Helm Functions

## Helm Pipelines

## Helm Dependencies and working with multiple charts

---

TO BE CONTINUED