DROP TABLE IF EXISTS estate;
CREATE TABLE estate (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name TEXT,                  -- Наименование БЦ / площади
    square DECIMAL DEFAULT 0.00,
    price DECIMAL DEFAULT 0.00, -- Цена за 1 кв. метр в год
    commission DECIMAL DEFAULT 0.00,
    address TEXT,               -- Адрес в свободной форме
    latitude FLOAT,
    longtitude FLOAT,
    metro_station VARCHAR(255) NOT NULL DEFAULT '',
    contact_phone VARCHAR(255) NOT NULL DEFAULT '',
    photo VARCHAR(255) NOT NULL DEFAULT '',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;
