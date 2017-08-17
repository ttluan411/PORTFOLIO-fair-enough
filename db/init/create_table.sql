--

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS event CASCADE;
DROP TABLE IF EXISTS bills CASCADE;
DROP TABLE IF EXISTS transactions  CASCADE;
DROP TABLE IF EXISTS balance CASCADE;
DROP TABLE IF EXISTS friendGroup CASCADE;


CREATE TABLE IF NOT EXISTS users (
	userId SERIAL PRIMARY KEY,
	givenName TEXT NOT NULL,
	familyName TEXT NOT NULL,
	email TEXT NOT NULL,
	profileName TEXT NOT NULL,
	picture TEXT,
	auth0Id TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS event (
	eventId SERIAL PRIMARY KEY,
	eventName TEXT NOT NULL,
	eventDate TEXT NOT NULL,
	totalExpense DECIMAL(9,2) NOT NULL,
	eachPersonExpense DECIMAL(9,2) NOT NULL,
	userId INTEGER REFERENCES users(userId)
);
CREATE TABLE IF NOT EXISTS friendGroup (
	friendGroupId SERIAL PRIMARY KEY,
	friendId INTEGER REFERENCES users(userId),
	eventId INTEGER REFERENCES event(eventId),
  borrowed DECIMAL (9,2) NOT NULL,
  lent DECIMAL (9,2) NOT NULL
);
CREATE TABLE IF NOT EXISTS bills (
	billId SERIAL PRIMARY KEY,
	amount DECIMAL(9,2) NOT NULL,
	createTime TEXT NOT NULL,
	billsName TEXT NOT NULL,
	currency TEXT NOT NULL,
	userId INTEGER REFERENCES users(userId),
	eventId INTEGER REFERENCES event(eventId),
	amountSettled DECIMAL(9,2) NOT NULL,
	splitType TEXT NOT NULL,
	isSettled BOOLEAN NOT NULL,
	groupId INTEGER REFERENCES friendGroup(friendGroupId)
);



CREATE TABLE IF NOT EXISTS transactions (
	transactionId SERIAL PRIMARY KEY,
	amount DECIMAL(9,2) NOT NULL,
	createTime TEXT NOT NULL,
	borrowerId INTEGER NOT NULL,
	lenderId INTEGER REFERENCES users(userId),
	eventId INTEGER REFERENCES event(eventId),
  billId INTEGER REFERENCES bills(billId)
);

CREATE TABLE IF NOT EXISTS balance (
	balanceId SERIAL PRIMARY KEY,
  amountUserOwes DECIMAL(9,2) NOT NULL,
	amountUserIsOwed DECIMAL(9,2) NOT NULL,
	eventId INTEGER REFERENCES event(eventId),
	userId INTEGER REFERENCES users(userId),
	amountUserCollected DECIMAL(9,2) NOT NULL,
	amountUserPaidBack DECIMAL(9,2) NOT NULL
);
--
INSERT INTO users (auth0Id, givenName, familyName, email, profileName, picture)
VALUES
('nasd1234', 'George', 'Lopez','george@gmail.com', 'timmy','http://www.stickpng.com/assets/thumbs/5845e5e9fb0b0755fa99d7e5.png'),
('na635', 'Im', 'Khem','Im@gmail.com', 'IK','http://www.stickpng.com/assets/thumbs/5845e5e9fb0b0755fa99d7e5.png'),
('n34ggh1234', 'Huy', 'Dang','Huydang@gmail.com', 'HuyHuy','http://www.stickpng.com/assets/thumbs/5845e5e9fb0b0755fa99d7e5.png')
