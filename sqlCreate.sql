CREATE TABLE IF NOT EXISTS source(
    sourceId INTEGER PRIMARY KEY,
    name TEXT,
    metaUI JSONB,
    created TIMESTAMP DEFAULT (NOW() AT TIME ZONE 'utc'),
    modified TIMESTAMP DEFAULT (NOW() AT TIME ZONE 'utc')
);
CREATE TABLE IF NOT EXISTS ticker_data_type(
    tickerDataTypeId INTEGER PRIMARY KEY,
    name TEXT
);
CREATE TABLE IF NOT EXISTS ticker_type(
    tickerTypeId INTEGER PRIMARY KEY,
    name TEXT
);
CREATE TABLE IF NOT EXISTS ticker(
    tickerId INTEGER PRIMARY KEY,
    tickerDataTypeId INTEGER NOT NULL REFERENCES ticker_data_type (tickerDataTypeId) ON DELETE CASCADE,
    attributeTypeId INTEGER NOT NULL REFERENCES ticker_type (tickerTypeId) ON DELETE CASCADE,
    sourceId INTEGER NOT NULL REFERENCES source (sourceId) ON DELETE CASCADE,
    name TEXT,
    metaUI JSONB,
    modified TIMESTAMP DEFAULT (NOW() AT TIME ZONE 'utc')
);
CREATE TABLE IF NOT EXISTS ticker_data(
    tickerDataId BIGSERIAL PRIMARY KEY,
    tickerId INTEGER NOT NULL REFERENCES ticker (tickerId) ON DELETE CASCADE,
    value NUMERIC,
    modified TIMESTAMP DEFAULT (NOW() AT TIME ZONE 'utc')
);
