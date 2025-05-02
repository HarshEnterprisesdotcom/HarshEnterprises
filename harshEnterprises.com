# Define the content for each file

# Common CSS (style.css)
style_css = """
body {
    font-family: Arial, sans-serif;
    background: #f9f9f9;
    margin: 0;
    padding: 0;
    color: #333;
}
header, footer {
    background-color: #ffffff;
    border-bottom: 1px solid #ddd;
    padding: 1em;
    text-align: center;
}
nav a {
    margin: 0 15px;
    text-decoration: none;
    color: #333;
}
.container {
    padding: 20px;
    max-width: 1200px;
    margin: auto;
}
.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
}
.product-card {
    background: #fff;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    text-align: center;
}
.product-card img {
    width: 100%;
    max-height: 150px;
    object-fit: cover;
}
footer {
    margin-top: 40px;
}
"""

# Common JS (script.js)
script_js = """
let cart = [];

function addToCart(productName, price) {
    cart.push({ name: productName, price: price });
    alert(`${productName} added to cart!`);
}
"""

# Header and footer template
header = """
<header>
    <h1>My Online Store</h1>
    <nav>
        <a href="index.html">Home</a>
        <a href="shop.html">Shop</a>
        <a href="about.html">About</a>
        <a href="contact.html">Contact</a>
    </nav>
</header>
"""

footer = """
<footer>
    <p>&copy; 2025 My Online Store. All rights reserved.</p>
</footer>
"""

# HTML Pages
index_html = f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - My Online Store</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
{header}
<div class="container">
    <h2>Welcome to My Online Store</h2>
    <p>Find the best products at unbeatable prices!</p>
</div>
{footer}
</body>
</html>
"""

shop_html = f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shop - My Online Store</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
</head>
<body>
{header}
<div class="container">
    <h2>Shop</h2>
    <div class="product-grid">
        <div class="product-card">
            <img src="assets/images/product1.jpg" alt="Product 1">
            <h3>Product 1</h3>
            <p>$10.00</p>
            <button onclick="addToCart('Product 1', 10)">Add to Cart</button>
        </div>
        <div class="product-card">
            <img src="assets/images/product2.jpg" alt="Product 2">
            <h3>Product 2</h3>
            <p>$15.00</p>
            <button onclick="addToCart('Product 2', 15)">Add to Cart</button>
        </div>
    </div>
</div>
{footer}
</body>
</html>
"""

product_html = f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details - My Online Store</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
</head>
<body>
{header}
<div class="container">
    <h2>Product Name</h2>
    <img src="assets/images/product1.jpg" alt="Product" style="max-width: 300px;">
    <p><strong>Price:</strong> $10.00</p>
    <p>Detailed description of the product goes here.</p>
    <button onclick="addToCart('Product Name', 10)">Add to Cart</button>
</div>
{footer}
</body>
</html>
"""

about_html = f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - My Online Store</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
{header}
<div class="container">
    <h2>About Us</h2>
    <p>We are a small team dedicated to providing the best quality products at fair prices.</p>
</div>
{footer}
</body>
</html>
"""

contact_html = f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact - My Online Store</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
{header}
<div class="container">
    <h2>Contact Us</h2>
    <form>
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name"><br><br>
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email"><br><br>
        <label for="message">Message:</label><br>
        <textarea id="message" name="message"></textarea><br><br>
        <button type="submit">Send</button>
    </form>
</div>
{footer}
</body>
</html>
"""

# Write content to the files
files_to_write = {
    "style.css": style_css,
    "script.js": script_js,
    "index.html": index_html,
    "shop.html": shop_html,
    "product.html": product_html,
    "about.html": about_html,
    "contact.html": contact_html
}

for filename, content in files_to_write.items():
    file_path = os.path.join(base_dir, filename)
    with open(file_path, "w") as f:
        f.write(content)

"All files have been written with content."