{{ config(materialized='table') }}

with source_data as (

    select *
    from pokemon.snorlax_pokemon_types

)

select *
from source_data