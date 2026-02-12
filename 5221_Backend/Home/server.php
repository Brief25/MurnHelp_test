<?php
require("config/connection.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {


if (isset($_POST['comment'])) {
    $name    = trim($_POST['name']);
    $email   = trim($_POST['email']);
    $message = trim($_POST['message']);
    $sub = trim($_POST['sub']);

    // Validate fields
    if (empty($name) || empty($email) || empty($message) || empty($sub)) {
        $error = "All fields are required.";
        echo $error;
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email address.";
        echo $error;
    } else {
        // Check if email already exists
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM comments WHERE email = ?");
        $stmt->execute([$email]);
        if ($stmt->fetchColumn() > 0) {
            // Email exists
            echo "This email has already submitted a comment.<br>";
            echo "<a href='../../../index.html'>Go Back To Home Page</a>";
        } else {
            // Insert new comment
            $stmt = $pdo->prepare("INSERT INTO comments (name, email, subject, messages) VALUES (?, ?, ?, ?)");
            $stmt->execute([$name, $email, $sub, $message]);

            echo "<script>alert('Your comment has been submitted successfully!');</script>";
            echo "<meta http-equiv='refresh' content='3;url=../../index.html'>";
        }
    }
}

/*
if (isset($_POST['crimson_subscriber'])) {

    $email = trim($_POST['email']);

    // Validate
    if (empty($email)) {
        die("Email is required.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Invalid email format.");
    }

    // Check if already subscribed
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM CrimsonSubscribers WHERE email = ?");
    $stmt->execute([$email]);

    if ($stmt->fetchColumn() > 0) {
        echo "<script>alert('You are already subscribed.');</script>";
        echo "<meta http-equiv='refresh' content='1;url=../../5221_Blogs/index.php'>";
        exit;
    }

    // Insert subscriber
    $stmt = $pdo->prepare("INSERT INTO CrimsonSubscribers (email) VALUES (?)");
    $stmt->execute([$email]);

    echo "<script>alert('Subscription successful!');</script>";
    echo "<meta http-equiv='refresh' content='3;url=../../5221_Blogs/index.php'>";
}

if (isset($_POST['monochrome_subscriber'])) {

    $email = trim($_POST['email']);

    // Validate
    if (empty($email)) {
        die("Email is required.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Invalid email format.");
    }

    // Check if already subscribed
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM MonochromeSubscribers WHERE email = ?");
    $stmt->execute([$email]);

    if ($stmt->fetchColumn() > 0) {
        echo "<script>alert('You are already subscribed.');</script>";
        echo "<meta http-equiv='refresh' content='1;url=../../5221_Shop/index.html'>";
        exit;
    }

    // Insert subscriber
    $stmt = $pdo->prepare("INSERT INTO MonochromeSubscribers (email) VALUES (?)");
    $stmt->execute([$email]);

    echo "<script>alert('Subscription successful!');</script>";
    echo "<meta http-equiv='refresh' content='3;url=../../5221_Shop/index.html'>";
}
*/
/* =========================
   HELPER FUNCTION
   ========================= */
function alertAndRedirect($message, $isCrimson) {
    $_SESSION['alert_message'] = $message;

    if ($isCrimson) {
        header("Location: ../../5221_Blogs/index.php");
    } else {
        header("Location: ../../5221_Shop/index.html");
    }
    exit;
}

/* =========================
   FORM HANDLER
   ========================= */
if (isset($_POST['crimson_subscriber']) || isset($_POST['monochrome_subscriber'])) {

    $email = trim($_POST['email'] ?? '');

    // Decide which table to use
    $isCrimson = isset($_POST['crimson_subscriber']);
    $table = $isCrimson ? "CrimsonSubscribers" : "MonochromeSubscribers";

    // Validate empty
    if (empty($email)) {
        alertAndRedirect("Email is required!", $isCrimson);
    }

    // Validate format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        alertAndRedirect("Invalid email format!", $isCrimson);
    }

    // Check duplicate
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM $table WHERE email = ?");
    $stmt->execute([$email]);

    if ($stmt->fetchColumn() > 0) {
        alertAndRedirect("You are already subscribed.", $isCrimson);
    }

    // Insert
    $stmt = $pdo->prepare("INSERT INTO $table (email) VALUES (?)");
    $stmt->execute([$email]);

    alertAndRedirect("Subscription successful!", $isCrimson);
}

}
?>
