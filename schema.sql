CREATE TABLE IF NOT EXISTS sessions(token TEXT PRIMARY KEY,expires_at INTEGER NOT NULL);
CREATE TABLE IF NOT EXISTS venues(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,address TEXT NOT NULL,maps_url TEXT DEFAULT '');
CREATE TABLE IF NOT EXISTS fixtures(id INTEGER PRIMARY KEY AUTOINCREMENT,round TEXT NOT NULL,group_name TEXT NOT NULL CHECK(group_name IN ('A','B')),home TEXT NOT NULL,away TEXT NOT NULL,kickoff TEXT DEFAULT '',venue_id INTEGER,home_score INTEGER,away_score INTEGER,published INTEGER NOT NULL DEFAULT 0,home_code_hash TEXT NOT NULL,away_code_hash TEXT NOT NULL,home_response TEXT,away_response TEXT,FOREIGN KEY(venue_id) REFERENCES venues(id));
CREATE INDEX IF NOT EXISTS fixtures_group_idx ON fixtures(group_name);
CREATE INDEX IF NOT EXISTS fixtures_round_idx ON fixtures(round);
