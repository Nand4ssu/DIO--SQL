CREATE DATABASE db_tcgpokemon_cards;
USE db_tcgpokemon_cards;

CREATE TABLE tbl_collections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    collectionSetName VARCHAR(100) NOT NULL,
    releaseDate DATE NOT NULL,
    totalCardsInCollection SMALLINT UNSIGNED NOT NULL
);

CREATE TABLE tbl_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    typeName VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE tbl_stages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    stageName VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE tbl_cards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hp SMALLINT UNSIGNED,
    name VARCHAR(80) NOT NULL,
    info TEXT,
    attack VARCHAR(100),
    damage VARCHAR(10),
    weak VARCHAR(20),
    resis VARCHAR(20),
    retreat VARCHAR(20),
    cardNumberInCollection SMALLINT UNSIGNED NOT NULL,
    collection_id INT NOT NULL,
    type_id INT NOT NULL,
    stage_id INT NOT NULL,
    FOREIGN KEY (collection_id) REFERENCES tbl_collections(id),
    FOREIGN KEY (type_id) REFERENCES tbl_types(id),
    FOREIGN KEY (stage_id) REFERENCES tbl_stages(id)
);
INSERT INTO tbl_collections (collectionSetName, releaseDate, totalCardsInCollection)
VALUES ('Base Set', '1999-01-09', 102);

INSERT INTO tbl_types (typeName)
VALUES ('Electric');

INSERT INTO tbl_stages (stageName)
VALUES ('Basic');

INSERT INTO tbl_cards (
    hp, name, info, attack, damage, weak, resis, retreat,
    cardNumberInCollection, collection_id, type_id, stage_id
)
VALUES (
    60,
    'Pikachu',
    'Mouse Pokémon. Known for its electric abilities.',
    'Thunder Jolt',
    '30',
    'Fighting',
    'Steel',
    '1 Colorless',
    58,
    1,
    1,
    1
);

INSERT INTO tbl_cards (hp, name, info, attack, damage, weak, resis, retreat, cardNumberInCollection, collection_id, type_id, stage_id)
VALUES
(60, 'Pikachu', 'Mouse Pokémon', 'Thunder Jolt', '30', 'Fighting', 'Steel', '1 Colorless', 58, 1, 1, 1),
(120, 'Charizard', 'Flame Pokémon', 'Fire Spin', '100', 'Water', 'Grass', '3 Colorless', 4, 1, 2, 3),
(100, 'Blastoise', 'Shellfish Pokémon', 'Hydro Pump', '60+', 'Electric', 'Steel', '3 Colorless', 2, 1, 3, 3),
(80, 'Venusaur', 'Seed Pokémon', 'Solar Beam', '60', 'Fire', 'Water', '2 Colorless', 15, 1, 4, 3),
(70, 'Raichu', 'Mouse Pokémon', 'Thunder', '60', 'Fighting', 'Steel', '2 Colorless', 14, 1, 1, 2),
(50, 'Jigglypuff', 'Balloon Pokémon', 'Pound', '20', 'Steel', 'Psychic', '1 Colorless', 54, 1, 5, 1),
(90, 'Gengar', 'Shadow Pokémon', 'Nightmare', '30', 'Psychic', 'Fighting', '2 Colorless', 29, 1, 6, 2),
(60, 'Machamp', 'Superpower Pokémon', 'Seismic Toss', '60', 'Psychic', 'Steel', '3 Colorless', 8, 1, 7, 3),
(40, 'Caterpie', 'Worm Pokémon', 'String Shot', '10', 'Fire', 'Grass', '1 Colorless', 45, 1, 4, 1),
(50, 'Metapod', 'Cocoon Pokémon', 'Harden', '—', 'Fire', 'Grass', '2 Colorless', 46, 1, 4, 2),
(70, 'Butterfree', 'Butterfly Pokémon', 'Whirlwind', '20', 'Fire', 'Grass', '1 Colorless', 47, 1, 4, 3),
(60, 'Magmar', 'Spitfire Pokémon', 'Smokescreen', '10', 'Water', 'Grass', '2 Colorless', 36, 1, 2, 1),
(100, 'Arcanine', 'Legendary Pokémon', 'Flamethrower', '50', 'Water', 'Grass', '3 Colorless', 23, 1, 2, 2),
(80, 'Poliwrath', 'Tadpole Pokémon', 'Water Gun', '30+', 'Electric', 'Steel', '2 Colorless', 13, 1, 3, 3),
(60, 'Kadabra', 'Psi Pokémon', 'Confusion', '30', 'Psychic', 'Steel', '2 Colorless', 32, 1, 6, 2),
(40, 'Abra', 'Psi Pokémon', 'Psyshock', '10', 'Psychic', 'Steel', '1 Colorless', 31, 1, 6, 1),
(70, 'Hitmonchan', 'Punching Pokémon', 'Special Punch', '40', 'Psychic', 'Steel', '2 Colorless', 7, 1, 7, 1),
(90, 'Electabuzz', 'Electric Pokémon', 'Thunder Shock', '30', 'Fighting', 'Steel', '2 Colorless', 20, 1, 1, 1),
(60, 'Zapdos', 'Electric Pokémon', 'Thunderstorm', '60', 'Fighting', 'Steel', '3 Colorless', 16, 1, 1, 3),
(100, 'Mewtwo', 'Genetic Pokémon', 'Psychic', '40+', 'Psychic', 'Steel', '3 Colorless', 10, 1, 6, 1);

INSERT INTO tbl_types (typeName)
VALUES 
('Fairy'),
('Psychic'),
('Fighting');

INSERT INTO tbl_types (typeName)
VALUES 
('Fire'),
('Water'),
('Grass'),
('Steel');

INSERT INTO tbl_stages (stageName)
VALUES 
('Stage 1'),
('Stage 2');

INSERT INTO tbl_cards (hp, name, info, attack, damage, weak, resis, retreat, cardNumberInCollection, collection_id, type_id, stage_id)
VALUES
(50, 'Bulbasaur', 'Seed Pokémon', 'Leech Seed', '20', 'Fire', 'Water', '1 Colorless', 44, 1, 4, 1),
(60, 'Ivysaur', 'Seed Pokémon', 'Vine Whip', '30', 'Fire', 'Water', '2 Colorless', 30, 1, 4, 2),
(80, 'Charmander', 'Lizard Pokémon', 'Ember', '30', 'Water', 'Grass', '1 Colorless', 46, 1, 2, 1),
(90, 'Charmeleon', 'Flame Pokémon', 'Flamethrower', '50', 'Water', 'Grass', '2 Colorless', 24, 1, 2, 2),
(50, 'Squirtle', 'Tiny Turtle Pokémon', 'Bubble', '20', 'Electric', 'Steel', '1 Colorless', 63, 1, 3, 1),
(70, 'Wartortle', 'Turtle Pokémon', 'Withdraw', '—', 'Electric', 'Steel', '2 Colorless', 42, 1, 3, 2),
(40, 'Pidgey', 'Tiny Bird Pokémon', 'Gust', '10', 'Electric', 'Fighting', '1 Colorless', 57, 1, 5, 1),
(60, 'Pidgeotto', 'Bird Pokémon', 'Whirlwind', '20', 'Electric', 'Fighting', '1 Colorless', 17, 1, 5, 2),
(80, 'Pidgeot', 'Bird Pokémon', 'Hurricane', '30', 'Electric', 'Fighting', '2 Colorless', 22, 1, 5, 3),
(50, 'Rattata', 'Mouse Pokémon', 'Bite', '20', 'Fighting', 'Psychic', '1 Colorless', 61, 1, 5, 1),
(70, 'Raticate', 'Mouse Pokémon', 'Super Fang', '—', 'Fighting', 'Psychic', '2 Colorless', 40, 1, 5, 2),
(60, 'Nidoran♀', 'Poison Pin Pokémon', 'Scratch', '20', 'Psychic', 'Grass', '1 Colorless', 55, 1, 4, 1),
(70, 'Nidorina', 'Poison Pin Pokémon', 'Double Kick', '30x', 'Psychic', 'Grass', '2 Colorless', 36, 1, 4, 2),
(80, 'Nidoqueen', 'Drill Pokémon', 'Mega Punch', '40', 'Psychic', 'Grass', '3 Colorless', 12, 1, 4, 3),
(60, 'Nidoran♂', 'Poison Pin Pokémon', 'Horn Attack', '30', 'Psychic', 'Grass', '1 Colorless', 56, 1, 4, 1),
(70, 'Nidorino', 'Poison Pin Pokémon', 'Horn Drill', '50', 'Psychic', 'Grass', '2 Colorless', 37, 1, 4, 2),
(90, 'Nidoking', 'Drill Pokémon', 'Thrash', '30+', 'Psychic', 'Grass', '3 Colorless', 11, 1, 4, 3),
(50, 'Oddish', 'Weed Pokémon', 'Absorb', '10', 'Fire', 'Water', '1 Colorless', 59, 1, 4, 1),
(70, 'Gloom', 'Weed Pokémon', 'Poisonpowder', '20', 'Fire', 'Water', '2 Colorless', 38, 1, 4, 2),
(90, 'Vileplume', 'Flower Pokémon', 'Petal Dance', '40x', 'Fire', 'Water', '2 Colorless', 15, 1, 4, 3),
(60, 'Diglett', 'Mole Pokémon', 'Dig', '20', 'Grass', 'Electric', '1 Colorless', 47, 1, 7, 1),
(70, 'Dugtrio', 'Mole Pokémon', 'Earthquake', '70', 'Grass', 'Electric', '2 Colorless', 19, 1, 7, 2),
(50, 'Geodude', 'Rock Pokémon', 'Tackle', '20', 'Grass', 'Electric', '1 Colorless', 48, 1, 7, 1),
(70, 'Graveler', 'Rock Pokémon', 'Rock Throw', '40', 'Grass', 'Electric', '2 Colorless', 39, 1, 7, 2),
(90, 'Golem', 'Megaton Pokémon', 'Explosion', '100', 'Grass', 'Electric', '3 Colorless', 21, 1, 7, 3),
(60, 'Gastly', 'Gas Pokémon', 'Lick', '10', 'Psychic', 'Fighting', '1 Colorless', 49, 1, 6, 1),
(70, 'Haunter', 'Gas Pokémon', 'Hypnosis', '—', 'Psychic', 'Fighting', '2 Colorless', 25, 1, 6, 2),
(90, 'Alakazam', 'Psi Pokémon', 'Confuse Ray', '30', 'Psychic', 'Fighting', '3 Colorless', 1, 1, 6, 3),
(60, 'Onix', 'Rock Snake Pokémon', 'Rock Throw', '10', 'Grass', 'Electric', '1 Colorless', 56, 1, 7, 1),
(80, 'Chansey', 'Egg Pokémon', 'Double-Edge', '80', 'Fighting', 'Psychic', '1 Colorless', 3, 1, 5, 1);

INSERT INTO tbl_cards (hp, name, info, attack, damage, weak, resis, retreat, cardNumberInCollection, collection_id, type_id, stage_id)
VALUES
(60, 'Clefairy', 'Fairy Pokémon', 'Sing', '—', 'Steel', 'Psychic', '1 Colorless', 5, 1, 5, 1),
(120, 'Clefable', 'Fairy Pokémon', 'Metronome', '—', 'Steel', 'Psychic', '2 Colorless', 6, 1, 5, 2),
(50, 'Ekans', 'Snake Pokémon', 'Wrap', '10', 'Psychic', 'Grass', '1 Colorless', 60, 1, 4, 1),
(70, 'Arbok', 'Cobra Pokémon', 'Poison Fang', '20', 'Psychic', 'Grass', '2 Colorless', 22, 1, 4, 2),
(40, 'Zubat', 'Bat Pokémon', 'Leech Life', '10', 'Psychic', 'Fighting', '1 Colorless', 62, 1, 6, 1),
(60, 'Golbat', 'Bat Pokémon', 'Wing Attack', '30', 'Psychic', 'Fighting', '2 Colorless', 33, 1, 6, 2),
(80, 'Paras', 'Mushroom Pokémon', 'Scratch', '20', 'Fire', 'Water', '1 Colorless', 64, 1, 4, 1),
(90, 'Parasect', 'Mushroom Pokémon', 'Spore', '—', 'Fire', 'Water', '2 Colorless', 26, 1, 4, 2),
(50, 'Meowth', 'Scratch Cat Pokémon', 'Pay Day', '10', 'Fighting', 'Psychic', '1 Colorless', 65, 1, 5, 1),
(70, 'Persian', 'Classy Cat Pokémon', 'Scratch', '20', 'Fighting', 'Psychic', '2 Colorless', 27, 1, 5, 2),
(60, 'Psyduck', 'Duck Pokémon', 'Headache', '—', 'Electric', 'Steel', '1 Colorless', 66, 1, 3, 1),
(80, 'Golduck', 'Duck Pokémon', 'Hyper Beam', '20', 'Electric', 'Steel', '2 Colorless', 28, 1, 3, 2),
(50, 'Mankey', 'Pig Monkey Pokémon', 'Scratch', '20', 'Psychic', 'Steel', '1 Colorless', 67, 1, 7, 1),
(80, 'Primeape', 'Pig Monkey Pokémon', 'Fury Swipes', '20x', 'Psychic', 'Steel', '2 Colorless', 34, 1, 7, 2),
(60, 'Growlithe', 'Puppy Pokémon', 'Flame Tail', '20', 'Water', 'Grass', '1 Colorless', 68, 1, 2, 1),
(90, 'Arcanine', 'Legendary Pokémon', 'Take Down', '50', 'Water', 'Grass', '2 Colorless', 23, 1, 2, 2),
(50, 'Poliwag', 'Tadpole Pokémon', 'Bubble', '10', 'Electric', 'Steel', '1 Colorless', 69, 1, 3, 1),
(70, 'Poliwhirl', 'Tadpole Pokémon', 'Amnesia', '20', 'Electric', 'Steel', '2 Colorless', 35, 1, 3, 2),
(90, 'Poliwrath', 'Tadpole Pokémon', 'Submission', '40', 'Electric', 'Steel', '3 Colorless', 13, 1, 3, 3),
(60, 'Tentacool', 'Jellyfish Pokémon', 'Acid', '10', 'Electric', 'Steel', '1 Colorless', 70, 1, 3, 1),
(80, 'Tentacruel', 'Jellyfish Pokémon', 'Supersonic', '—', 'Electric', 'Steel', '2 Colorless', 41, 1, 3, 2),
(50, 'Magnemite', 'Magnet Pokémon', 'Thunder Wave', '10', 'Fighting', 'Steel', '1 Colorless', 71, 1, 1, 1),
(70, 'Magneton', 'Magnet Pokémon', 'Selfdestruct', '80', 'Fighting', 'Steel', '2 Colorless', 9, 1, 1, 2),
(60, 'Farfetch’d', 'Wild Duck Pokémon', 'Leek Slap', '30', 'Electric', 'Steel', '1 Colorless', 72, 1, 5, 1),
(80, 'Doduo', 'Twin Bird Pokémon', 'Fury Attack', '10x', 'Electric', 'Fighting', '1 Colorless', 73, 1, 5, 1),
(90, 'Dodrio', 'Triple Bird Pokémon', 'Rage', '30+', 'Electric', 'Fighting', '2 Colorless', 18, 1, 5, 2),
(60, 'Seel', 'Sea Lion Pokémon', 'Headbutt', '20', 'Electric', 'Steel', '1 Colorless', 74, 1, 3, 1),
(80, 'Dewgong', 'Sea Lion Pokémon', 'Aurora Beam', '50', 'Electric', 'Steel', '2 Colorless', 26, 1, 3, 2),
(60, 'Grimer', 'Sludge Pokémon', 'Poison Gas', '10', 'Psychic', 'Fighting', '1 Colorless', 75, 1, 6, 1),
(80, 'Muk', 'Sludge Pokémon', 'Sludge', '30', 'Psychic', 'Fighting', '2 Colorless', 19, 1, 6, 2);

SELECT * FROM tbl_cards;

CREATE VIEW vw_cards_detailed AS
SELECT 
    c.id,
    c.hp,
    c.name,
    c.info,
    c.attack,
    c.damage,
    c.weak,
    c.resis,
    c.retreat,
    c.cardNumberInCollection,
    col.collectionSetName AS collectionName,
    col.releaseDate AS collectionReleaseDate,
    col.totalCardsInCollection,
    t.typeName AS typeName,
    s.stageName AS stageName
FROM tbl_cards c
INNER JOIN tbl_collections col ON c.collection_id = col.id
INNER JOIN tbl_types t ON c.type_id = t.id
INNER JOIN tbl_stages s ON c.stage_id = s.id;

SELECT 
    id,
    hp,
    name,
    info,
    attack,
    damage,
    weak,
    resis,
    retreat,
    cardNumberInCollection,
    collectionName,
    collectionReleaseDate,
    totalCardsInCollection,
    typeName,
    stageName
FROM vw_cards_detailed;






