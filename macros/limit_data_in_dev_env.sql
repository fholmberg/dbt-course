{% macro limit_data_in_dev_env(column_name) %}
{% if target.anme == 'development' %}
where {{column_name}} >= dateadd('day', -30, current_timestamp)
{% endif %%}
{% endmacro %}