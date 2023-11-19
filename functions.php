<?php

function pdo_connect_mysql() {
    $DATABASE_HOST = 'localhost';
    $DATABASE_USER = 'root';
    $DATABASE_PASS = 'root';
    $DATABASE_NAME = 'shoppingcart';
    try {
    	return new PDO('mysql:host=' . $DATABASE_HOST . ';dbname=' . $DATABASE_NAME . ';charset=utf8', $DATABASE_USER, $DATABASE_PASS);
    } catch (PDOException $exception) {
        exit('Failed to connect to database! Error: ' . $exception->getMessage());
    }
}
function template_header($title) {
    $num_items_in_cart = isset($_SESSION['cart']) ? count($_SESSION['cart']) : 0;

    echo <<<EOT
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <title>$title</title>
            <link href="style.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
        </head>
        <body>
            <header>
                <div class="content-wrapper">
                    <h1>Boutique</h1>
                    <nav>
                        <a href="index.php">Home</a>
                        <a href="index.php?page=products">Produits</a>
                    </nav>
                    <div class="search-bar">
                        <form action="index.php?page=products" method="get">
                            <input type="text" name="search" placeholder="... ">
                            <button type="submit"><i class="fas fa-search"></i></button>
                        </form>
                    </div>
                    <div class="link-icons">
                        <a href="index.php?page=cart">
                            <i class="fas fa-shopping-cart"></i>
                            <span>$num_items_in_cart</span>
                        </a>
                    </div>
                </div>
            </header>
            <main>
    EOT;

    if (isset($_GET['search']) && !empty($_GET['search'])) {
        $searchTerm = urldecode(htmlspecialchars($_GET['search'], ENT_QUOTES, 'UTF-8'));
        $stmt = $pdo->prepare('SELECT id FROM products WHERE name LIKE ?');
        $stmt->execute(["%$searchTerm%"]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($result) {
            $productId = $result['id'];
            header("Location: index.php?page=product&id=$productId");
            exit;
        } else {
            echo '<p>Product not found. Please try again.</p>';
        }
    }
}

function template_footer() {
$year = date('Y');
echo <<<EOT
        </main>
        <footer>
            <div class="content-wrapper">
                <p>&copy; $year, Shopping Cart System</p>
            </div>
        </footer>
    </body>
</html>
EOT;
}
?>  