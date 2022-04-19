-- +goose Up
-- +goose StatementBegin
CREATE TABLE users
(
    id         VARCHAR(32) PRIMARY KEY,
    login      VARCHAR(128) NOT NULL UNIQUE,
    updated_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cost
(
    task       VARCHAR(32) PRIMARY KEY,
    cost       INTEGER   NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE audit
(
    user_id    VARCHAR(32) REFERENCES users (id),
    task_id    VARCHAR(32) REFERENCES cost (task),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE users;
DROP TABLE cost;
DROP TABLE audit;
-- +goose StatementEnd
