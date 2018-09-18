# gh-contrib-sh
Create contribution report of your github

## Usage

```bash
 $ ./gh-contrib.sh -h
Usage: ./gh-contrib.sh -u <user> -s YYYY-MM-DD -e YYYY-MM-DD
  -u: your github user name
  -s: start date to get your contribution
  -e: end date to get your contribution
```

## Example

```bash
$ ./gh-contrib.sh -u chaspy -s 2018-09-01 -e 2018-09-02
Hi chaspy, this is your contribution report :tada: in 2018-09-01..2018-09-02
# Pull Request
your created and merged pull request is 3!!
Add go test base
https://github.com/kamontia/qs/pull/79

Update gopkg.lock for coloring package when Windows envriontment
https://github.com/kamontia/qs/pull/81

Change loglevel appropriately
https://github.com/kamontia/qs/pull/82%                                                                                                                                               /Users/take/go/src/github.com/gist/gh-contrib-sh
```
