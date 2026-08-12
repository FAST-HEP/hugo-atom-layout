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
- `services.rss.limit`
- the configured language locale

When no author name is configured, the site title is used.

## Development

```bash
pixi run test
```
