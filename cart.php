<?php

if (isset($_POST['product_id'], $_POST['quantity']) && is_numeric($_POST['product_id']) && is_numeric($_POST['quantity'])) {
    $product_id = (int)$_POST['product_id'];
    $quantity = (int)$_POST['quantity'];
    $stmt = $pdo->prepare('SELECT * FROM products WHERE id = ?');
    $stmt->execute([$_POST['product_id']]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($product && $quantity > 0) {
        if (isset($_SESSION['cart']) && is_array($_SESSION['cart'])) {
            if (array_key_exists($product_id, $_SESSION['cart'])) {
                $_SESSION['cart'][$product_id] += $quantity;
            } else {
                $_SESSION['cart'][$product_id] = $quantity;
            }
        } else {
            $_SESSION['cart'] = array($product_id => $quantity);
        }
    }
    header('location: index.php?page=cart');
    exit;
}

if (isset($_GET['remove']) && is_numeric($_GET['remove']) && isset($_SESSION['cart']) && isset($_SESSION['cart'][$_GET['remove']])) {
    unset($_SESSION['cart'][$_GET['remove']]);
}

if (isset($_POST['update']) && isset($_SESSION['cart'])) {
    foreach ($_POST as $k => $v) {
        if (strpos($k, 'quantity') !== false && is_numeric($v)) {
            $id = str_replace('quantity-', '', $k);
            $quantity = (int)$v;
            if (is_numeric($id) && isset($_SESSION['cart'][$id]) && $quantity > 0) {
                $_SESSION['cart'][$id] = $quantity;
            }
        }
    }
    header('location: index.php?page=cart');
    exit;
}

if (isset($_POST['placeorder']) && isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    header('Location: index.php?page=placeorder');
    exit;
}

$products_in_cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();
$products = array();
$subtotal = 0.00;
if ($products_in_cart) {
    $array_to_question_marks = implode(',', array_fill(0, count($products_in_cart), '?'));
    $stmt = $pdo->prepare('SELECT * FROM products WHERE id IN (' . $array_to_question_marks . ')');
    $stmt->execute(array_keys($products_in_cart));
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($products as $product) {
        $subtotal += (float)$product['price'] * (int)$products_in_cart[$product['id']];
    }
}

if (isset($_POST['removeLast']) && isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    $lastKey = max(array_keys($_SESSION['cart']));
    unset($_SESSION['cart'][$lastKey]);
    header('location: index.php?page=cart');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['placeorder']) && isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    try {
        $customerName = $_POST['customer_name'];
        $address = $_POST['address'];
        $phone = $_POST['phone'];
        $subtotal = $_POST['subtotal'];
        $orderDate = date('Y-m-d H:i:s');
        $stmt = $pdo->prepare('INSERT INTO orders (customer_name, address, phone, subtotal, order_date) VALUES (?, ?, ?, ?, ?)');
        $stmt->execute([$customerName, $address, $phone, $subtotal, $orderDate]);
        $_SESSION['cart'] = array();
        header('Location: suivi.php');
        exit;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['placeorder']) && isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    try {
        $_SESSION['cart'] = array();
        header('Location: suivi.php');
        exit;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['removeLast']) && isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    try {
        $lastKey = max(array_keys($_SESSION['cart']));
        unset($_SESSION['cart'][$lastKey]);

        header('location: index.php?page=cart');
        exit;
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
}


?>

<?=template_header('Cart')?>

<div class="cart content-wrapper">
    <h1>Panier</h1>

    <form action="index.php?page=cart" method="post">
        <table>
            <thead>
                <tr>
                    <td colspan="2">Produits</td>
                    <td>Prix</td>
                    <td>Quantité</td>
                    <td>Total</td>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($products)): ?>
                <tr>
                    <td colspan="5" style="text-align:center;">Il n'y a pas de produits dans votre panier</td>
                </tr>
                <?php else: ?>
                <?php foreach ($products as $product): ?>
                <tr>
                    <td class="img">
                        <a href="index.php?page=product&id=<?=$product['id']?>">
                            <img src="imgs/<?=$product['img']?>" width="50" height="50" alt="<?=$product['name']?>">
                        </a>
                    </td>
                    <td>
                        <a href="index.php?page=product&id=<?=$product['id']?>"><?=$product['name']?></a>
                        <br>
                        <a href="suivi.php?remove=<?=$product['id']?>" class="remove">Remove</a>
                    </td>
                    <td class="price">&dollar;<?=$product['price']?></td>
                    <td class="quantity">
                        <input type="number" name="quantity-<?=$product['id']?>"
                            value="<?=$products_in_cart[$product['id']]?>" min="1" max="<?=$product['quantity']?>"
                            placeholder="Quantity" required>
                    </td>
                    <td class="price">&dollar;<?=$product['price'] * $products_in_cart[$product['id']]?></td>
                </tr>
                <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
        <div class="subtotal">
            <span class="text">Total</span>
            <span class="price">&dollar;<?=$subtotal?></span>
            <input type="hidden" name="subtotal" value="<?=$subtotal?>">
            <input type="hidden" name="products" value="<?= htmlspecialchars(serialize($products))?>">
        </div>
        <div class="buttons">
            <?php if (!empty($products_in_cart)): ?>
                <input type="submit" value="Retirer la dernière ligne" name="removeLast">
            <?php endif; ?>
        </div>
    </form>

    <form action="suivi.php" method="post">
        <label for="customer_name">Nom:</label>
        <input type="text" id="customer_name" name="customer_name" required>

        <label for="address">Adresse:</label>
        <textarea id="address" name="address" required></textarea>

        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" required>

        <input type="submit" value="Passer la commande" name="placeorder">
    </form>
</div>

<?=template_footer()?>