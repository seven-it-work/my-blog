<div align="right">
  Language:
  :us:
  <a title="Chinese" href="docs/zh-CN/CONTRIBUTING.md">:cn:</a>
  <a title="Russian" href="../docs/ru/CONTRIBUTING.md">:ru:</a>
</div>

# <div align="center"><a title="Go to homepage" href="https://theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>

First of all, thanks for taking your time to contribute and help make our project even better than it is today! The following is a set of guidelines for contributing to [Theme-Next](https://github.com/theme-next) and its libs submodules. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

## Table Of Contents

[How Can I Contribute?](#how-can-i-contribute)

  * [Before Submitting An Issue](#before-submitting-an-issue)
    * [Read the docs](#read-the-docs)
    * [Quick debug instructions](quick-debug-instructions)
  * [Reporting Bugs](#reporting-bugs)
    * [Reporting Security Bugs](#reporting-security-bugs)
  * [Suggesting Enhancements](#suggesting-enhancements)
  * [Submitting a Pull Request](#submitting-a-pull-request)
  * [Creating Releases](#creating-releases)

[Guides](#guides)

  * [Coding Rules](#coding-rules)
  * [Coding Standards](#coding-standards)
  * [Labels Rules](#labels-rules)
  * [Commit Messages Rules](#commit-messages-rules)

## How Can I Contribute?

### Before Submitting An Issue

#### Read the docs

If you just have a question, you'll get faster results by checking the [FAQs for a list of common questions and problems](https://theme-next.org/docs/faqs) or the [troubleshooting part of «NexT» Documentation Site](https://theme-next.org/docs/troubleshooting).

Also, you can perform a [cursory search](https://github.com/theme-next/hexo-theme-next/search?q=&type=Issues&utf8=%E2%9C%93) to see if the problem has already been reported or solved. You don't want to duplicate effort. You might be able to find the cause of the problem and fix things yourself, or add comments to the existed issue.

#### Quick debug instructions

Before submitting an Issue on GitHub, you can follow the steps below to debug:

* Execute `hexo clean`, clear the browser cache and disable all CDN services (e.g. Cloudflare Rocket Loader)
* Switch to another theme and check if the bug still exists (e.g. default theme landscape). In other words, prove that this is a NexT issue, not a issue from Hexo.
* Upgrade theme NexT to the latest version.
* Upgrade Hexo and Hexo plugins to the latest version.
* Upgrade Node.js and `npm` to the latest version.
* Uninstall all non-essential Hexo plugins, or reinstall all plugins using `npm install --save`.

If you get an error message from Hexo or your browser, please search in Google / Stackoverflow / GitHub Issues, or report it to us when submitting a new Issue.

If you find a bug in the source code, most importantly, please check carefully if you can reproduce the problem [in the latest release version of Next](https://github.com/theme-next/hexo-theme-next/releases/latest). Then, you can help us by [Reporting Bugs](#reporting-bugs) or [Suggesting Enhancements](#suggesting-enhancements) to our [Repository](https://github.com/theme-next/hexo-theme-next). Even better, you can [submit a Pull Request](#submitting-a-pull-request) with a fix.

### Reporting Bugs

Before creating bug reports, please check [this list](#before-submitting-an-issue) as you might find out that you don't need to create one. After you've determined the repository your bug is related to, create an issue on that repository and provide the information as many details as possible by filling in [the required template](ISSUE_TEMPLATE.md).

Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior, and find related reports:

* Use a clear and descriptive title for the issue to identify the problem.
* Provide more context by answering these questions:
    * Can you reproduce the problem? Can you reliably reproduce the issue? If not, provide details about how often the problem happens and under which conditions it normally happens.
    * Did the problem start happening recently or was this always a problem?
    * If the problem started happening recently, can you reproduce the problem in an older version of Next? What's the most recent version in which the problem doesn't happen? You can download older versions of Next from [the releases page](https://github.com/theme-next/hexo-theme-next/releases).
    * Which version of Node, Hexo and Next are you using? You can get the exact version by running `node -v`, `hexo version` in your terminal, or copy the contents in site's`package.json`.
    * Which packages do you have installed? You can get that list by copying the contents in site's`package.json`.
* Describe the exact steps which reproduce the problem in as many details as possible. When listing steps, don't just say what you did, but explain how you did it, e.g. which command exactly you used. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/creating-and-highlighting-code-blocks/) or [a permanent link to a code snippet](https://help.github.com/articles/creating-a-permanent-link-to-a-code-snippet/), or a [Gist link](https://gist.github.com/).
* Provide specific examples to demonstrate the steps. Include links to files (screenshots or GIFs) or live demo.
* Describe the behavior you observed after following the steps and point out what exactly is the problem with that behavior.
* Explain which behavior you expected to see instead and why.

#### Reporting Security Bugs

If you find a security issue, please act responsibly and report it not in the public issue tracker, but directly to us, so we can fix it before it can be exploited. Please send the related information to security@theme-next.com (desirable with using PGP for e-mail encryption).

We will gladly special thanks to anyone who reports a vulnerability so that we can fix it. If you want to remain anonymous or pseudonymous instead, please let us know that; we will gladly respect your wishes.

### Suggesting Enhancements

Before creating enhancement suggestions, please check [this list](#before-submitting-an-issue) as you might find out that you don't need to create one. After you've determined the repository your enhancement suggestion is related to, create an issue on that repository and provide the information as many details as possible by filling in [the required template](ISSUE_TEMPLATE.md).

Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions.

* Use a clear and descriptive title for the issue to identify the suggestion.
* Describe the current behavior and explain which behavior you expected to see instead and Explain why this enhancement would be useful to most users.
* Provide specific examples to demonstrate the suggestion. Include links to files (screenshots or GIFs) or live demo.

### Submitting a Pull Request

Before creating a Pull Request (PR), please check [this list](#before-submitting-an-issue) as you might find out that you don't need to create one. After you've determined the repository your pull request is related to, create a pull request on that repository. The detailed document of creating a pull request can be found [here](https://help.github.com/articles/creating-a-pull-request/).

Following these guidelines helps maintainers and the community understand your pull request :pencil::

* Follow our [Coding Rules](#coding-rules) and [commit message conventions](#commit-messages-rules).
* Use a clear and descriptive title for the issue to identify the pull request. Do not include issue numbers in the PR title.
* Fill in [the required template](.github/PULL_REQUEST_TEMPLATE.md) as many details as possible.
* All features or bug fixes must be tested in all schemes. And provide specific examples to demonstrate the pull request. Include links to files (screenshots or GIFs) or live demo.

### Creating Releases

Releases are a great way to ship projects on GitHub to your users.

1. On GitHub, navigate to the main page of the repository. Under your repository name, click **Releases**. Click **Draft a new release**.
2. Type a version number for your release. Versions are based on [Git tags](https://git-scm.com/book/en/Git-Basics-Tagging). We recommend naming tags that fit within [About Major and Minor NexT versions](https://github.com/theme-next/hexo-theme-next/issues/187).
3. Select a branch that contains the project you want to release. Usually, you'll want to release against your `master` branch, unless you're releasing beta software.
4. Type a title and description that describes your release.
    - Use the version as the title.
    - The types of changes include **Breaking Changes**, **Updates**, **Features**, and **Bug Fixes**. In the section of Breaking Changes, use multiple secondary headings, and use item list in other sections.
    - Use the passive tense and subject-less sentences.
    - All changes must be documented in release notes. If commits happen without pull request (minimal changes), just add this commit ID into release notes. If commits happen within pull request alreay, just add the related pull request ID including all possible commits.
5. If you'd like to include binary files along with your release, such as compiled programs, drag and drop or select files manually in the binaries box.
6. If the release is unstable, select **This is a pre-release** to notify users that it's not ready for production. If you're ready to publicize your release, click **Publish release**. Otherwise, click **Save draft** to work on it later.

## Guides

### Coding Rules

This project and everyone participating in it is governed by the [Code of Conduct](.github/CODE_OF_CONDUCT.md) to keep open and inclusive. By participating, you are expected to uphold this code.

### Coding Standards

We use ESLint and Stylint for identifying and reporting on patterns in JavaScript and Stylus, with the goal of making code more consistent and avoiding bugs. These specifications should be followed when coding.

### Labels Rules

We use "labels" in the issue tracker to help classify Pull requests and Issues. Using labels enables maintainers and users to quickly find issues they should look into, either because they experience them, or because it meets their area of expertise.

If you are unsure what a label is about or which labels you should apply to a PR or issue, look no further!

Issues related:

- By types
    - `Bug`: A detected bug that needs to be confirmed
    - `Feature Request`: An issue that wants a new feature
    - `Question`: An issue about questions
    - `Meta`: Denoting a change of usage conditions
    - `Support`: An issue labeled as support requests
    - `Polls`: An issue that initiated a poll
- By results
    - `Duplicate`: An issue which had been mentioned
    - `Irrelevant`: An irrelevant issue for Next
    - `Invalid`: An issue that cannot be reproduced
    - `Expected Behavior`: An issue that corresponds to expected behavior
    - `Need More Info`: Need more information for solving the issue
    - `Verified`: An issue that has been verified
    - `Solved`: An issue that has been solved
    - `Backlog`: An issue that is to be completed and later compensated
    - `Stale`: This issue has been automatically marked as stale because lack of recent activity

Pull requests related:

- `Breaking Change`: A pull request that makes breaking change
- `Bug Fix`: A pull request that fixes the related bug
- `New Feature`: A pull request that provides a new feature
- `Feature`: A pull request that provides an option or addition to existing feature
- `i18n`: A pull request that makes new languages translation
- `Work in Progress`: A pull request that is still working in progress
- `Skip Release`: A pull request that should be excluded from release note

Both:

- `Roadmap`: An issue / pull request about future development
- `Help Wanted`: An issue / pull request that needs help
- `Discussion`: An issue / pull request that needs to be discussed
- `Improvement`: An issue that needs improvement or a pull request that improves NexT
- `Performance`: An issue / pull request that improves the performance
- `Hexo`: An issue / pull request related to Hexo or Hexo plugins
- `Template Engine`: An issue / pull request related to template engine
- `CSS`: An issue / pull request related to CSS
- `Fonts`: An issue / pull request related to fonts
- `PJAX`: An issue / pull request related to PJAX
- `3rd Party Plugin`: An issue / pull request related to 3rd party plugins & service
- `Docs`: An issue / pull request related to instruction document
- `Configurations`: An issue / pull request related to configurations

### Commit Messages Rules

We have very precise rules over how our git commit messages can be formatted. Each commit message consists of a `type` and a `subject`. This leads to more
readable messages that are easy to follow when looking through the project history.

- `type` describes the meaning of this commit including but not limited to the following items, and capitalize the first letter.
    * `Build`: Changes that affect the build system or external dependencies
    * `Ci`: Changes to our CI configuration files and scripts
    * `Docs`: Documentation only changes
    * `Feat`: A new feature
    * `Fix`: A bug fix
    * `Perf`: A code change that improves performance
    * `Refactor`: A code change that neither fixes a bug nor adds a feature
    * `Style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
    * `Revert`: Revert some existing commits
    * `Release`: Commit a release for a conventional changelog project
- The `subject` contains a succinct description of the change, like `Update code highlighting in readme.md`.
    * No dot (.) at the end.
    * Use the imperative, present tense: "change" not "changed" nor "changes".
