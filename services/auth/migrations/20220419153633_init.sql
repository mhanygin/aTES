-- +goose Up
-- +goose StatementBegin
CREATE TABLE users
(
    id         VARCHAR(32) PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL,
    login      VARCHAR(128) NOT NULL UNIQUE,
    passwd     VARCHAR(128) NOT NULL,
    role_id    VARCHAR(32) REFERENCES roles (id),
    updated_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE roles
(
    id   VARCHAR(32) PRIMARY KEY,
    role VARCHAR(128) NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE users;
DROP TABLE roles;
-- +goose StatementEnd
