-- 1. Thêm User (Giữ nguyên)
INSERT INTO Users (FullName, Email, PasswordHash, Role) VALUES 
('Admin User', 'admin@aibuddy.com', 'hashed_password_here', 'admin'),
('Demo User', 'user@aibuddy.com', 'hashed_password_here', 'user');

-- 2. Thêm Personas (TIẾNG ANH)
-- Lưu ý: SystemPrompt rất quan trọng, nó định hình tính cách AI
INSERT INTO Personas (PersonaID, PersonaName, Description, SystemPrompt, Icon, IsPremium) VALUES 
(1, 'Bestie', 'Always by your side', 'You are a supportive, empathetic best friend. You use casual language, emojis, and slang appropriate for Gen Z. Your goal is to listen and validate the user\'s feelings without being too clinical. Always reply in English.', '👯', FALSE),
(2, 'Therapist', 'Professional CBT support', 'You are a professional psychologist using Cognitive Behavioral Therapy (CBT) techniques. Help the user analyze their thoughts objectively. Be calm, professional, and ask guiding questions. Always reply in English.', '🧠', TRUE),
(3, 'Career Coach', 'Guidance for your future', 'You are a pragmatic and motivating career mentor. Help the user with career planning, work stress, and productivity tips. Be direct and action-oriented. Always reply in English.', '🚀', TRUE);

-- 3. Thêm Topics (TIẾNG ANH)
INSERT INTO Topics (TopicID, TopicName, Description) VALUES 
(1, 'Daily Reflection', 'Check in with yourself today'),
(2, 'Academic Stress', 'Exams, deadlines, and grades'),
(3, 'Relationship Issues', 'Friends, family, and partners'),
(4, 'Work-Life Balance', 'Managing burnout and productivity');

-- 4. Session mẫu (Tùy chọn)
INSERT INTO ChatSessions (UserID, PersonaID, TopicID, Title) VALUES 
(2, 1, 1, 'A chill chat about my day');