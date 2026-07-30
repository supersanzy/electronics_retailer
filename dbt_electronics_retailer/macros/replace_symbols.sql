{% {% macro replace_symbols(column_name) %}
    replace({{column_name}}, '$', '')
{% endmacro %}%}