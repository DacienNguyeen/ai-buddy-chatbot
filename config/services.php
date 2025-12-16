<?php
// Kiểm tra xem file mật có tồn tại không
$envPath = __DIR__ . '/env.php';
$env = file_exists($envPath) ? require $envPath : [];

return [
    'gemini' => [
        // Lấy key từ file env.php, nếu không có thì để rỗng hoặc fallback
        'api_key' => $env['GEMINI_API_KEY'] ?? 'KEY_NOT_FOUND', 
        'model' => 'gemini-2.5-flash',
        'timeout' => 30 
    ]
];
?>