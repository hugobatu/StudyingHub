-- Role
CREATE TABLE Role (
    role_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    role_name VARCHAR(60) NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- User
CREATE TABLE "User" (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_name VARCHAR(60) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    hashed_password TEXT NOT NULL,
    is_banned BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
select VERSION()
-- User_Streak
CREATE TABLE User_Streak (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES "User" (user_id) ON DELETE CASCADE,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- User_Role (Many-to-many relationship between User and Role)
CREATE TABLE User_Role (
    user_id UUID REFERENCES "User" (user_id) ON DELETE CASCADE,
    role_id UUID REFERENCES Role (role_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, role_id)
);

-- Example triggers or function for updating timestamps (optional)
CREATE OR REPLACE FUNCTION update_timestamp() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger for User table to update `updated_at` on modification
CREATE TRIGGER user_update_timestamp
BEFORE UPDATE ON "User"
FOR EACH ROW EXECUTE FUNCTION update_timestamp();

-- Trigger for Role table to update `updated_at` on modification
CREATE TRIGGER role_update_timestamp
BEFORE UPDATE ON Role
FOR EACH ROW EXECUTE FUNCTION update_timestamp();

-- Trigger for User_Streak table to update `updated_at` on modification
CREATE TRIGGER user_streak_update_timestamp
BEFORE UPDATE ON User_Streak
FOR EACH ROW EXECUTE FUNCTION update_timestamp();
