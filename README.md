## setup log
```
  $ mkdir project_dir
  $ git init
  $ touch .keep
  $ git add .keep
  $ git commit 'create repos'
  $ rm .keep
  $ rbenv local 2.2.3
  $ bundle init
  $ vi Gemfile
    - gem "rails"
    + gem "middleman"
```
