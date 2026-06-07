import os

c = get_config()  # noqa: F821  (injected by traitlets config loader)

_here = os.path.dirname(os.path.abspath(__file__))

c.TemplateExporter.extra_template_basedirs = [os.path.join(_here, 'templates')]
c.PDFExporter.template_name = 'compact_pdf'
c.LatexExporter.template_name = 'compact_pdf'
