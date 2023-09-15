# Github

## github actions

### Parallel jobs example

```bash
name: My parallel build workflow example
on: [push]
jobs:
  build:
    runs-on: self-hosted
    steps:
      - run: |
          echo "BO: building the application"
          # [...]
          echo "EO: building the application"
  integration-testing:
    needs: build
    runs-on: self-hosted
    steps:
      - run: |
          echo "BO: integration tests"
          # [...]
          echo "EO: integration tests"
  functional-testing:
    needs: build
    runs-on: self-hosted
    steps:
      - run: |
          echo "BO: functional tests"
          # [...]
          echo "EO: functional tests"
  deploy:
    needs: [integration-testing, functional-testing]
    runs-on: self-hosted
    steps:
      - run: |
          echo "BO: deploying application"
          # [...]
          echo "EO: deploying application"
```

## Links

* [GitHub Actions: Parallel Jobs – Example](https://www.shellhacks.com/github-actions-parallel-jobs-example/) - 20221221

