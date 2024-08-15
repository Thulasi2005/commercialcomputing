<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "donation_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(array('success' => false, 'message' => 'Database connection failed: ' . $conn->connect_error)));
}

// Read JSON input
$input = json_decode(file_get_contents('php://input'), true);

// Debug: Log received parameters
file_put_contents('php://stderr', print_r($input, TRUE));

$id = isset($input['id']) ? intval($input['id']) : 0;
$status = isset($input['status']) ? $conn->real_escape_string($input['status']) : '';

if (empty($id) || empty($status)) {
    echo json_encode(array('success' => false, 'message' => 'Invalid parameters'));
    exit();
}

$sql = "UPDATE service_requests SET status = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('si', $status, $id);

if ($stmt->execute()) {
    echo json_encode(array('success' => true));
} else {
    echo json_encode(array('success' => false, 'message' => 'Failed to update request'));
}

$stmt->close();
$conn->close();
?>
