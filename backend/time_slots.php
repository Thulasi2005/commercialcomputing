<?php
session_start();
$_SESSION['elderly_home_id'] = 1; // Set this for testing
require 'config.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $elderly_home_id = isset($_SESSION['elderly_home_id']) ? $_SESSION['elderly_home_id'] : null;

    // Debugging: Log session and received data
    error_log("Session elderly_home_id: " . print_r($elderly_home_id, true));
    $data = json_decode(file_get_contents('php://input'), true);
    error_log("Received data: " . print_r($data, true));

    if (!$data) {
        echo json_encode(['success' => false, 'message' => 'Invalid JSON format']);
        exit;
    }

    $date = isset($data['date']) ? $data['date'] : null;
    $time_slots = isset($data['time_slots']) ? $data['time_slots'] : null;

    if ($elderly_home_id && $date && $time_slots) {
        $success = true;
        foreach ($time_slots as $time_slot => $is_available) {
            $sql = "INSERT INTO time_slots (elderly_home_id, date, time_slot, is_available) VALUES (?, ?, ?, ?)
                    ON DUPLICATE KEY UPDATE is_available = ?";
            $stmt = $conn->prepare($sql);
            if ($stmt === false) {
                error_log("Prepare failed: " . $conn->error);
                $success = false;
                break;
            }
            $stmt->bind_param("issii", $elderly_home_id, $date, $time_slot, $is_available, $is_available);
            if (!$stmt->execute()) {
                error_log("Execute failed: " . $stmt->error);
                $success = false;
                break;
            }
        }

        if ($success) {
            echo json_encode(['success' => true, 'message' => 'Time slots updated successfully']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Failed to update time slots']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Missing required parameters']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}

$conn->close();
?>
