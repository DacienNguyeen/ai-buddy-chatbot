-- 1. Bảng Users (Người dùng hệ thống)
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Role ENUM('user', 'admin') DEFAULT 'user', -- Phân quyền Admin
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Bảng Personas (Các nhân vật AI: Bạn bè, Bác sĩ,...)
CREATE TABLE IF NOT EXISTS Personas (
    PersonaID INT AUTO_INCREMENT PRIMARY KEY,
    PersonaName VARCHAR(50) NOT NULL,
    Description VARCHAR(255),
    SystemPrompt TEXT NOT NULL, -- Hướng dẫn hành vi cho AI
    Icon VARCHAR(50) DEFAULT '🤖', -- Icon hiển thị
    IsPremium BOOLEAN DEFAULT FALSE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Bảng Topics (Chủ đề trò chuyện gợi ý)
CREATE TABLE IF NOT EXISTS Topics (
    TopicID INT AUTO_INCREMENT PRIMARY KEY,
    TopicName VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Bảng ChatSessions (Các phiên chat)
CREATE TABLE IF NOT EXISTS ChatSessions (
    SessionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    PersonaID INT NOT NULL,
    TopicID INT DEFAULT NULL,
    Title VARCHAR(100) DEFAULT 'New Conversation',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (PersonaID) REFERENCES Personas(PersonaID),
    FOREIGN KEY (TopicID) REFERENCES Topics(TopicID)
);

-- 5. Bảng ChatMessages (Nội dung tin nhắn)
CREATE TABLE IF NOT EXISTS ChatMessages (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT NOT NULL,
    Sender ENUM('User', 'AI') NOT NULL,
    Content TEXT NOT NULL,
    ImagePath VARCHAR(255) DEFAULT NULL, -- Hỗ trợ gửi ảnh
    AudioUrl VARCHAR(255) DEFAULT NULL,  -- Hỗ trợ voice
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SessionID) REFERENCES ChatSessions(SessionID) ON DELETE CASCADE
);

-- 6. Bảng EmotionLogs (Nhật ký cảm xúc)
CREATE TABLE IF NOT EXISTS EmotionLogs (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    MoodScore INT NOT NULL, -- 1 đến 5
    MoodLabel VARCHAR(50),  -- 'Happy', 'Sad'...
    Note TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);