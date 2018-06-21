# githubbub

### Purpose
This is a collection of simple ruby scripts reliant on
[Octokit](https://github.com/octokit/octokit.rb).

It makes markdown files that shed light on corporate GitHub information:
- your organization's repositories (a table)
- your org's members (a list)
- your org's admins (a list)
- your org's humans without 2FA turned on (a hopefully-empty list)

The markdown files live at the top of the repo, so one would be easily able
to make the reports visible to, say, any eng in your org who's a GitHub member.
(The [.gitignore](.gitignore) excludes markdown files by default, just in case.)

This could run periodically on some company jenkins / gitlab infrastructure, and
could have commit notifications routing to IRC/slack/Hangouts Chat etc.

It's also basically the first thing I've done 'from scratch' in ruby,
so there's probably a lot going on here that's bad or wrong (and probably both).


### Use
1. Be sure to generate an API token.
   Put it in the top of the repo in a file named `.token`;
   a newline at EOF is ok.

   So, `[...]/github-utils/.token` should look something like this:

   ```
   000011112222aaaabbbbcccc33334444dddd5555

   ```
1. Modify [vars.yaml](scripts/vars.yaml) as appropriate for your org,
   desired repository fields/ordering, and botroster (which can be empty if
   your GitHub bots have 2FA enabled).
1. `rake` from top of repo to generate all reports & place in top of repo.
1. Optionally, `rake -T` from the top of the repo to see available tasks.


### Notes
- You may also want to have rvm installed, but maybe not.
- Some functionality is for org admins only.
