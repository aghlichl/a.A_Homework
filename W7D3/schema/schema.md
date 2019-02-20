# XELP SCHEMA

`USER`

| **column name**   | **data type** | **details**               |
|-------------------|---------------|---------------------------|
| `id`              | integer       | not null, primary key     |
| `email`           | string        | not null, indexed, unique |
| `password_digest` | string        | not null                  |
| `session_token`   | string        | not null, indexed, unique |
| `created_at`      | datetime      | not null                  |
| `updated_at`      | datetime      | not null                  |

- index on `email` unique: true
- index on `session_token` unique: true



`REVIEW`
| **column name** | **data type**  | **details**                    |
|-----------------|----------------|--------------------------------|
| `id`            | integer        | not null, primary key          |
| `body`          | string         | not null                       |
| `photos`        | varbinary(max) |                                |
| `num_useful`    | integer        |                                |
| `num_cool`      | integer        |                                |
| `num_funny`     | integer        |                                |
| `user_id`       | integer        | not null, indexed, foreign key |
| `business_id`   | integer        | not null, indexed, foreign key |
| `created_at`    | datetime       | not null                       |
| `updated_at`    | datetime       | not null                       |

- `user_id` references `user`
- `business_id` references `business`
- index on `user_id` unique: true
- index on `business_id` unique: true


`BUSINESS`
| **column name** | **data type**  | **details**                    |
|-----------------|----------------|--------------------------------|
| `id`            | integer        | not null, primary key          |
| `name`          | string         | not null                       |
| `category`      | string         | not null                       |
| `dollar_sign`   | integer        | not null                       |
| `address`       | string         | not null                       |
| `phone`         | string         | not null                       |
| `website`       | string         | not null                       |
| `avg_rating`    | float          | not null                       |
| `created_at`    | datetime       | not null                       |
| `updated_at`    | datetime       | not null                       |

- `business` has many photos through `review`






