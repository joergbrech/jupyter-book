{%- extends 'markdown.tpl' -%}


<!-- All code cells -->
{%- block codecell %}
<div markdown="1" class="cell code_cell">
{{- super() }}
</div>
{% endblock codecell %}

<!-- Add class for input area -->
{% block input %}
{%- if cell.source != '' -%}
<div class="input_area{% if 'hidecode' in cell.metadata.tags %} hidecode{% endif %}" markdown="1">
```
{%- if 'magics_language' in cell.metadata  -%}
    {{ cell.metadata.magics_language}}
{%- elif 'name' in nb.metadata.get('language_info', {}) -%}
    {{ nb.metadata.language_info.name }}
{% endif %}
{{- cell.source }}
```
</div>
{%- endif %}
{% endblock input %}

<!-- All output areas -->
{% block output %}
<div class="output_wrapper" markdown="1">
<div class="output_subarea{% if 'interactive' in cell.metadata.tags %} output_widget_view{% endif %}" markdown="1">
{{- super() -}}
</div>
</div>
{%- endblock output %}

<!-- Remove indentations for output text  -->
{%- block stream %}
{:.output_stream}
```
{{ output.text }}
```
{% endblock stream %}


{% block data_text -%}
{:.output_data_text}
```
{{ output.data['text/plain'] }}
```
{% endblock data_text %}


{%- block error %}
{:.output_traceback_line}
```
{{- super() }}
```
{% endblock error %}

{%- block data_html %}
<div markdown="0" class="output output_html">
{{ output.data['text/html'] }}
</div>
{% endblock data_html %}

{%- block data_png %}
{:.output_png}
{{- super() }}
{% endblock data_png %}
