INSERT INTO users (auth0Id, givenName, familyName, email, profileName, picture)
VALUES ($1, $2, $3, $4, $5, $6)

RETURNING *;
