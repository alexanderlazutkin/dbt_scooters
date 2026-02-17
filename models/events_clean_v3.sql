{{ config(
    materialized='incremental',
    incremental_strategy='microbatch',
    unique_key=['user_id', 'timestamp', 'type_id'],
    begin='2023-06-01',
    event_time='timestamp',
    batch_size='month'
) }}

select distinct
    user_id,
    "timestamp",
    type_id,
    {{ updated_at() }},
    "date"
from
    {{ ref("events_prep") }}
