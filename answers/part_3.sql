# What is each pokemon's primary type?
select pokemons.name, types.name FROM pokemons INNER JOIN types ON pokemons.primary_type=types.id;

# What is Rufflet's secondary type?
select pokemons.name, types.name FROM pokemons
INNER JOIN types ON pokemons.secondary_type=types.id
where pokemons.name = "Rufflet";

# What are the names of the pokemon that belong to the trainer with trainerID 303?
select pokemons.name from pokemons
inner join pokemon_trainer ON pokemons.id=pokemon_trainer.pokemon_id
where pokemon_trainer.trainerID=303;

# How many pokemon have a secondary type Poison?
select count(*) from pokemons
inner join types on pokemons.secondary_type = types.id
where types.name = "Poison";


# What are all the primary types and how many pokemon have that type?
SELECT types.name,COUNT(DISTINCT(pokemons.id))
FROM types inner join pokemons on types.id = pokemons.primary_type
GROUP BY types.id;

# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
select count(distinct(pokemon_trainer.pokemon_id))
from pokemon_trainer
where pokemon_trainer.pokelevel >= 100
group by pokemon_trainer.trainerID;

# How many pokemon only belong to one trainer and no other?
SELECT COUNT(pokemon_id)
FROM (
    SELECT pokemon_id
    FROM pokemon_trainer
    GROUP BY pokemon_id
    HAVING COUNT(*) = 1
) AS ONLY_ONCE;
