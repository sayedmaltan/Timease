
CREATE TYPE e_role AS ENUM ('ROLE_USER', 'ROLE_ADMIN', 'ROLE_MODERATOR');

CREATE TABLE roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name e_role NOT NULL
);

CREATE TABLE _user (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    birthdate VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_account_enabled BOOLEAN DEFAULT false
);

CREATE TABLE user_roles (
    user_id UUID NOT NULL,
    role_id UUID NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES _user(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

CREATE TABLE refresh_tokens (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    token VARCHAR(255) UNIQUE NOT NULL,
    user_id UUID NOT NULL,
    expiry_date TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES _user(id) ON DELETE CASCADE
);

CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    notification_type VARCHAR(255),
    payload TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sent_at TIMESTAMP,
    is_sent BOOLEAN DEFAULT false NOT NULL
);

CREATE TABLE events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    title VARCHAR(255),
    description TEXT,
    location VARCHAR(255),
    duration INTEGER NOT NULL,
    max_attendees INTEGER,
    scheduling_range INTEGER,
    is_periodic BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES _user(id) ON DELETE CASCADE
);

CREATE TABLE availabilities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    event_id UUID NOT NULL,
    day_of_week VARCHAR(20),
    date DATE,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

CREATE TABLE meetings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    availability_id UUID NOT NULL,
    date DATE,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (availability_id) REFERENCES availabilities(id) ON DELETE CASCADE
);

CREATE TABLE meeting_attendees (
    meeting_id UUID NOT NULL,
    user_id UUID NOT NULL,
    PRIMARY KEY (meeting_id, user_id),
    FOREIGN KEY (meeting_id) REFERENCES meetings(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES _user(id) ON DELETE CASCADE
);


INSERT INTO roles (name) VALUES 
    ('ROLE_USER'),
    ('ROLE_ADMIN'),
    ('ROLE_MODERATOR');

CREATE OR REPLACE FUNCTION update_modified_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.modified_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_user_modified_at 
    BEFORE UPDATE ON _user 
    FOR EACH ROW 
    EXECUTE FUNCTION update_modified_at_column();