import sys
from pathlib import Path

sys.path.append(str(Path('_exts').resolve()))

project = '6P3-Notes'
project_copyright = [
    '2021-2023, Mauricio Bushinelli',
    "2023-%Y, Michael Haaf",
]
author = "John Abbott College Department of Computer Science"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "myst_parser",
    "notfound.extension",
    "sphinx.ext.graphviz",
    "sphinx.ext.intersphinx",
    "sphinx.ext.todo",
    "sphinx.ext.viewcode",
    "sphinx_comments",
    "sphinx_copybutton",
    "sphinx_design",
    "sphinx_favicon",
    "sphinx_prompt",
    "sphinx_tagtoctree",
    "sphinxcontrib.httpdomain",
    "sphinxcontrib.mermaid",
    "sphinxemoji.sphinxemoji",
    "sphinxext.opengraph",
    # "sphinx_tippy",
    "sphinx_togglebutton",
    "ablog",
    # "sphinxcontrib.bibtex",
    # "drafts",
]

# bibtex_bibfiles = ["references.bib"]

myst_enable_extensions = [
    "amsmath",
    "attrs_block",
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
myst_heading_anchors = 6
myst_enable_checkboxes = True

templates_path = ['_templates']
exclude_patterns = [
    '_build',
    'Thumbs.db',
    '.DS_Store',
    ".venv",
    "README.md",
    "**/_*",
]

favicons = [
    "favicon_io/favicon-16x16.png",
    "favicon_io/favicon-32x32.png",
    "favicon_io/favicon.ico",
    "favicon_io/apple-touch-icon.ng",
    "favicon_io/android-chrome-192x192.png",
    "favicon_io/android-chrome-512x512.png",
]


html_theme = "sphinx_book_theme"
html_title = "Connected Objects"
html_theme_options = {
    "repository_url": "https://github.com/john-abbott-college/6P3-Notes",
    "use_repository_button": True,
    "use_download_button": False,
    "logo": {
        "image_light": "_static/media/full-logo.svg",
        "image_dark": "_static/media/full-logo.svg",
    },
    "collapse_navbar": True,
    "max_navbar_depth": 1,
}
html_static_path = ['_static']
html_css_files = ["tippy.css"]
# html_sidebars = {
#    "**": ['globaltoc.html', 'sourcelink.html', 'searchbox.html'],
#    "lectures/index": ["ablog/categories.html"],
# }
html_sidebars = {
   "**": [
        'navbar-logo.html',
        'icon-links.html',
        'search-button-field.html',
        'sbt-sidebar-nav.html',
        "ablog/categories.html",
    ],
}

blog_path = "lectures"
post_auto_image = 0 # could set to 1, but need to do some css magic before this is worth it
