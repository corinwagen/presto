# personal website

## Introduction

This is a minimal static site generator written in Go.
I am not proficient in Go. This SSG is partly an exercise to help me learn a new language, so I make no guarantees re: code quality.

## Structure

There are two types of pages supported here: "blog" pages and "regular" pages. 

``src/`` contains the pages I write (in HTML) with a FrontMatter heading. All this code is embedded directly in the resulting page. 

``static/`` contains files which aren't frequently changed. 

``blog/`` contains the finished blog posts. 

and the index directory contains both the "main" pages and the actual script itself. 

## To Build

```
$ go run build.go
```
