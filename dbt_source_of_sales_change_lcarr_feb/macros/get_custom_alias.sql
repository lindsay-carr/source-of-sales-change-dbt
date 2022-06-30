{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
    {# Tim Chase - March 1, 2022 
       Prefix the table name with the 'prefix' in vars. #}
    {% set prefix = var('prefix') %}

    {%- if custom_alias_name is none -%}

        {{ prefix ~ '_' ~ node.name }}

    {%- else -%}

        {{ custom_alias_name | trim }}

    {%- endif -%}

{%- endmacro %}