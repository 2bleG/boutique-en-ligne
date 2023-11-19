<?php
session_start();

$DATABASE_HOST = 'localhost';
$DATABASE_USER = 'root';
$DATABASE_PASS = 'root';
$DATABASE_NAME = 'shoppingcart';

try {
    $pdo = new PDO('mysql:host=' . $DATABASE_HOST . ';dbname=' . $DATABASE_NAME . ';charset=utf8', $DATABASE_USER, $DATABASE_PASS);
} catch (PDOException $exception) {
    exit('Failed to connect to database! Error: ' . $exception->getMessage());
}

error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['placeorder'])) {
    try {
        $customerName = isset($_POST['customer_name']) ? $_POST['customer_name'] : '';
        $address = isset($_POST['address']) ? $_POST['address'] : '';
        $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
        $totalAmount = isset($_POST['subtotal']) ? $_POST['subtotal'] : 0;
        $productsDetails = isset($_POST['products']) ? $_POST['products'] : '';
        $subtotal = 0.00;
        $stmt = $pdo->prepare('INSERT INTO orders (customer_name, address, phone, total_amount, products) VALUES (?, ?, ?, ?, ?)');
        $stmt->execute([$customerName, $address, $phone, $totalAmount, $productsDetails]);
        $orderId = $pdo->lastInsertId();
        echo "<p>Merci pour votre commande ! Votre numéro de commande est : $orderId</p>";
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

?>

<div class="order-summary content-wrapper">
    <h1>Récapitulatif de votre commande</h1>
    <form action="suivi.php" method="post">

        <h2>Commande</h2>

        <p>Nom: <?=$customerName?></p>
        <p>Adresse: <?=$address?></p>
        <p>Phone: <?=$phone?></p>
        <p>total: <?=$totalAmount?></p>
        <p>details produits: <?=$productsDetails?></p>

    </form>
</div>
