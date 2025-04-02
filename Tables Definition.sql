-- Table of Cities

CREATE TABLE IF NOT EXISTS cities (
    id TEXT PRIMARY KEY,  
    name TEXT NOT NULL,     -- English label
    fre_name TEXT,          -- French label
    ger_name TEXT           -- German label
);

DO $$
BEGIN
    -- Check if the table is empty
    IF NOT EXISTS (SELECT 1 FROM cities LIMIT 1) THEN
        -- Import data if the table is empty
        COPY cities(id, name, fre_name, ger_name)
        FROM '/Users/leo/Documents/UNI/DM/ESTAT/VOCAB/ESTAT_CITIES.csv'
        DELIMITER E'\;'
        CSV HEADER;
    END IF;
END $$;


-- Table of statistical Indicators

CREATE TABLE IF NOT EXISTS indic (
    id TEXT PRIMARY KEY,  
    name TEXT NOT NULL,     -- English label
    fre_name TEXT,          -- French label
    ger_name TEXT           -- German label
);

DO $$
BEGIN
    -- Check if the table is empty
    IF NOT EXISTS (SELECT 1 FROM indic LIMIT 1) THEN
        -- Import data if the table is empty
        COPY indic(id, name, fre_name, ger_name)
        FROM '/Users/leo/Documents/UNI/DM/ESTAT/VOCAB/ESTAT_INDIC_UR.csv'
        DELIMITER E'\;'
        CSV HEADER;
    END IF;
END $$;


-- Table of Educational Observation

CREATE TABLE IF NOT EXISTS edu (
    ind TEXT,  
    city TEXT,     -- English label
    year SMALLINT CHECK (year BETWEEN 1989 AND 2024),
    obs INTEGER, 
	flag_id TEXT, 
	flag text, 
	conf_id TEXT, 
	conf text, 
    -- Foreign key constraints
    FOREIGN KEY (ind) REFERENCES indic(id),
    FOREIGN KEY (city) REFERENCES cities(id)
);

DO $$
BEGIN
    -- Check if the table is empty
    IF NOT EXISTS (SELECT 1 FROM edu LIMIT 1) THEN
        -- Import data if the table is empty
        COPY edu
        FROM '/Users/leo/Documents/UNI/DM/ESTAT/DATA/estat_urb_ceduc_en.csv'
        DELIMITER E'\;'
        CSV HEADER;
    END IF;
END $$;


-- Table of Environmental Observation

CREATE TABLE IF NOT EXISTS env (
    ind TEXT,  
    city TEXT,
    year SMALLINT CHECK (year BETWEEN 1989 AND 2024),
    obs NUMERIC, -- There are very large decimal values
	flag_id TEXT, 
	flag text, 
	conf_id TEXT, 
	conf text,
    -- Foreign key constraints
    FOREIGN KEY (ind) REFERENCES indic(id),
    FOREIGN KEY (city) REFERENCES cities(id)
);

DO $$
BEGIN
    -- Check if the table is empty
    IF NOT EXISTS (SELECT 1 FROM env LIMIT 1) THEN
        -- Import data if the table is empty
        COPY env
        FROM '/Users/leo/Documents/UNI/DM/ESTAT/DATA/estat_urb_cenv_en.csv'
        DELIMITER E'\;'
        CSV HEADER;
    END IF;
END $$;


-- Table of Fertility and Mortality Observation

CREATE TABLE IF NOT EXISTS fermor (
    ind TEXT,  
    city TEXT,
    year SMALLINT CHECK (year BETWEEN 1989 AND 2024),
    obs INTEGER, -- should be all integers
	flag_id TEXT, 
	flag text, 
	conf_id TEXT, 
	conf text,
    -- Foreign key constraints
    FOREIGN KEY (ind) REFERENCES indic(id),
    FOREIGN KEY (city) REFERENCES cities(id)
);

DO $$
BEGIN
    -- Check if the table is empty
    IF NOT EXISTS (SELECT 1 FROM fermor LIMIT 1) THEN
        -- Import data if the table is empty
        COPY fermor
        FROM '/Users/leo/Documents/UNI/DM/ESTAT/DATA/estat_urb_cfermor_en.csv'
        DELIMITER E'\;'
        CSV HEADER;
    END IF;
END $$;


-- Table of Labour Market Observation

CREATE TABLE IF NOT EXISTS lma (
    ind TEXT,  
    city TEXT,
    year SMALLINT CHECK (year BETWEEN 1989 AND 2024),
    obs INTEGER, 
	flag_id TEXT, 
	flag text, 
	conf_id TEXT, 
	conf text,
    -- Foreign key constraints
    FOREIGN KEY (ind) REFERENCES indic(id),
    FOREIGN KEY (city) REFERENCES cities(id)
);

DO $$
BEGIN
    -- Check if the table is empty
    IF NOT EXISTS (SELECT 1 FROM lma LIMIT 1) THEN
        -- Import data if the table is empty
        COPY lma
        FROM '/Users/leo/Documents/UNI/DM/ESTAT/DATA/estat_urb_clma_en.csv'
        DELIMITER E'\;'
        CSV HEADER;
    END IF;
END $$;


-- Table of Population Observation

CREATE TABLE IF NOT EXISTS pop (
    ind TEXT,  
    city TEXT,
    year SMALLINT CHECK (year BETWEEN 1989 AND 2024),
    obs INTEGER,
	flag_id TEXT, 
	flag text, 
    -- Foreign key constraints
    FOREIGN KEY (ind) REFERENCES indic(id),
    FOREIGN KEY (city) REFERENCES cities(id)
);

DO $$
BEGIN
    -- Check if the table is empty
    IF NOT EXISTS (SELECT 1 FROM pop LIMIT 1) THEN
        -- Import data if the table is empty
        COPY pop
        FROM '/Users/leo/Documents/UNI/DM/ESTAT/DATA/estat_urb_cpop1_en.csv'
        DELIMITER E'\;'
        CSV HEADER;
    END IF;
END $$;


-- Table of Tourism Observation

CREATE TABLE IF NOT EXISTS tour (
    ind TEXT,  
    city TEXT,
    year SMALLINT CHECK (year BETWEEN 1989 AND 2024),
    obs INTEGER,
	flag_id TEXT, 
	flag text, 
	conf_id TEXT, 
	conf text,
    -- Foreign key constraints
    FOREIGN KEY (ind) REFERENCES indic(id),
    FOREIGN KEY (city) REFERENCES cities(id)
);

DO $$
BEGIN
    -- Check if the table is empty
    IF NOT EXISTS (SELECT 1 FROM tour LIMIT 1) THEN
        -- Import data if the table is empty
        COPY tour
        FROM '/Users/leo/Documents/UNI/DM/ESTAT/DATA/estat_urb_ctour_en.csv'
        DELIMITER E'\;'
        CSV HEADER;
    END IF;
END $$;


-- Table of Transportation Observation

CREATE TABLE IF NOT EXISTS tran (
    ind TEXT,  
    city TEXT,
    year SMALLINT CHECK (year BETWEEN 1989 AND 2024),
    obs NUMERIC(10,2),
	flag_id TEXT, 
	flag text, 
	conf_id TEXT, 
	conf text,
    -- Foreign key constraints
    FOREIGN KEY (ind) REFERENCES indic(id),
    FOREIGN KEY (city) REFERENCES cities(id)
);

DO $$
BEGIN
    -- Check if the table is empty
    IF NOT EXISTS (SELECT 1 FROM tran LIMIT 1) THEN
        -- Import data if the table is empty
        COPY tran
        FROM '/Users/leo/Documents/UNI/DM/ESTAT/DATA/estat_urb_ctran_en.csv'
        DELIMITER E'\;'
        CSV HEADER;
    END IF;
END $$;


-- -- To drop exiting TABLES
-- drop table env;
-- drop table edu;
-- drop table pop;
-- drop table tour;
-- drop table tran;
-- drop table fermor;
-- drop table lma;
-- drop table cities;
-- drop table indic;