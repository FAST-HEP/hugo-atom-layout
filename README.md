# Hugo Atom Layout

A small Hugo subtheme providing an RFC 4287 Atom feed template.

> [!NOTE]
> This layout was developed primarily for the
> [Scientific Python Hugo theme](https://github.com/scientific-python/scientific-python-hugo-theme)
> and is currently tested only in that context. It may work with other Hugo
> themes, but compatibility with them is not guaranteed.

## Usage

Add the repository as a Git submodule under `themes/`, then include it in
the site’s theme configuration.

## Configuration

The template uses:

- `params.author.name`
- `params.author.email` (optional)
- `params.description` (optional)
- `params.atom.sections` (optional)
- `services.rss.limit`
- the configured language locale

When no author name is configured, the site title is used.

### Which pages appear in the home feed

The home feed (`/atom.xml`) only lists pages from the site's main sections,
so that subscribers to a blog do not receive every page on the site. Hugo
derives the main sections from the section with the most pages, and a site
can pin them with the top-level `mainSections` setting.

`params.atom.sections` overrides that list for the home feed:

```yaml
params:
  atom:
    sections: ["posts", "news"]
```

Use `["*"]` to include every regular page on the site. Section feeds such as
`/posts/atom.xml` always list the pages of their own section and ignore this
setting.

## Development

```bash
pixi run test
```
