-- +goose Up
-- +goose StatementBegin
-- +goose Up
-- +goose StatementBegin
CREATE TABLE users
(
    id         VARCHAR(32) PRIMARY KEY,
    login      VARCHAR(128) NOT NULL UNIQUE,
    updated_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE task
(
    id          VARCHAR(32) PRIMARY KEY,
    description VARCHAR(1024) NOT NULL,
    user_id     VARCHAR(32) REFERENCES users (id),
    complete    BOOLEAN                DEFAULT FALSE,
    updated_at  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin

-- +goose StatementEnd
