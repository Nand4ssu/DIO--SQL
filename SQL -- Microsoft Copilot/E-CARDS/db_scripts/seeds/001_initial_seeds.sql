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
