## Introduction

Krambook makes it easier to work with your ebooks. It currently provides two things;

1. Mimics the workflow of LeanPub.
	It will take your Book.txt parse it and save a `Joined.md` in your manuscript folder

2. Supports external source code files.

More things are planned in the future.

# Installation and Usage

## Install:

```sh
$ gem install krambook
````

## Usage:

cd into your LeanPub ebook folder and then run:

```sh
$ krambook
````

To include external code files:

```sh
$ krambook -f includey
```

The format for external files is:

```markdown
\~\~\~ ruby
This will be replaced by an external file
\~\~\~
{: .language-ruby include="external_file.rb"}
```

### Help:

To get help run:

```sh
$ krambook -h
```

# More Docs Coming Soon
