{% macro case_flag(condition) %}

    case when {{condition}} = 0 then 'online_store'
    else 'walk-in_store'
    end
    
{% endmacro %}