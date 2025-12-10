# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = '6P3-Notes'
copyright = '2021-2025, Michael Haaf, Mauricio Bushinelli'
author = 'Michael Haaf, Mauricio Bushinelli'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "myst_parser",
    "notfound.extension",
    "sphinx.ext.githubpages",
    "sphinx_design",
    "sphinx_favicon",
    # "sphinx_tags",
    "sphinx_prompt",
    "sphinx_comments",
    "sphinxext.opengraph",
    "sphinxcontrib.httpdomain",
    "sphinxcontrib.mermaid",
    # "sphinxcontrib.bibtex",
    "hoverxref.extension",
    "sphinxemoji.sphinxemoji",
]

tags_create_tags = True
tags_extension = ["md"]
hoverxref_auto_ref = True
# bibtex_bibfiles = ["references.bib"]

myst_enable_extensions = [
    "amsmath",
    "attrs_inline",
    "colon_fence",
    "deflist",
    "dollarmath",
    "fieldlist",
    "replacements",
    "smartquotes",
    "strikethrough",
    "substitution",
    "tasklist",
]
myst_title_to_header = True
myst_heading_anchors = 3
myst_enable_checkboxes = True

templates_path = ['_templates']
exclude_patterns = [
    '_build',
    'Thumbs.db',
    '.DS_Store',
    ".venv",
    "README.md",
]



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "sphinx_book_theme"
html_logo = "_static/media/full-logo.svg"
html_title = "Connected Objects"
html_theme_options = {
    "repository_url": "https://github.com/john-abbott-college/6P3-Notes",
    "use_repository_button": True,
}
html_static_path = ['_static']
