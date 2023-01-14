Use a [conventional commit message](https://www.conventionalcommits.org/) in your squash/merge commit message.
In particular, prefix the subject of the squash/merge commit message with one of the following:

* `fix:` if your PR contains no new functionality.
* `feat:` if your PR contains at least one new feature.
* Add an exclemation point to the end of the prefix (e.g., `fix!:`) if your PR contains a ***breaking change***
  (i.e., a change that is not backwards-compatible).

Also, please use [`Co-authored-by:`](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors)
to give credit to others who helped you with this PR.
